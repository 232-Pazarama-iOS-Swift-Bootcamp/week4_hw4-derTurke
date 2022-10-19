//
//  ProfileViewModel.swift
//  FlickrApi
//
//  Created by GÜRHAN YUVARLAK on 18.10.2022.
//

import Foundation
import FirebaseFirestore

protocol ProfileDelegate: AnyObject {
    func didErrorOccurred(_ error: Error)
    func didFetchFavorites()
}

final class ProfileViewModel {
    weak var delegate: ProfileDelegate?
    
    private let db = Firestore.firestore()
    
    private let defaults = UserDefaults.standard
    
    private var photos = [Photo]()
    
    var numberOfRows: Int {
        photos.count
    }
    
    func fetchFavoritesOrCollections(collection: String?) {
        photos = []
        guard let id = defaults.string(forKey: "uid"),
              let collection = collection else {
            return
        }
        db.collection("users").document(id).collection(collection).getDocuments { querySnapshot, error in
            if let error {
                self.delegate?.didErrorOccurred(error)
                return
            }
            guard (querySnapshot?.documents) != nil, let data = querySnapshot?.documents else {
                return
            }
            if data.isEmpty {
                self.delegate?.didFetchFavorites()
            } else {
                for item in data {
                    let favorites = Photo(from: item.data())
                    self.photos.append(favorites)
                    self.delegate?.didFetchFavorites()
                }
            }
        }
    }
    
    func profileForIndexPath(_ indexPath: IndexPath) -> Photo? {
        photos[indexPath.row]
    }
    
    func deleteFavoriteOrCollection(_ photo: Photo?, collection: String?) {
        guard let photo = photo,
              let photoId = photo.id,
              let id = defaults.string(forKey: "uid"),
              let collection = collection else {
            return
        }
        db.collection("users").document(id).collection(collection).document(photoId).delete() { error in
            if let error {
                self.delegate?.didErrorOccurred(error)
                return
            }
            self.fetchFavoritesOrCollections(collection: collection)
            
        }
    }
}
