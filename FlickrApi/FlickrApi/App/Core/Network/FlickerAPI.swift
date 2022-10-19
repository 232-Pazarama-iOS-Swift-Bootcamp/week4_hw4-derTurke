//
//  FlickerGetRecent.swift
//  FlickrApi
//
//  Created by GÜRHAN YUVARLAK on 18.10.2022.
//

import Foundation
import Moya

let flickerAPI = MoyaProvider<FlickerAPI>()

enum FlickerAPI {
    case getRecentPhotos
}

extension FlickerAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://www.flickr.com/services/rest") else {
            fatalError("Base URL not found or not in correct format.")
        }
        return url
    }
    
    var path: String {
        "/"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        let parameters: [String: Any] = ["method": "flickr.photos.getRecent",
                                         "api_key": "9d2f8465a46267b299c87c386312bdda",
                                         "format": "json",
                                         "nojsoncallback": "1",
                                         "extras" : "owner_name,url_c"]
        return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
    
    var headers: [String : String]? {
        nil
    }
    
    
}
