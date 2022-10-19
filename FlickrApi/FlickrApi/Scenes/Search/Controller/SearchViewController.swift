//
//  SearchViewController.swift
//  FlickrApi
//
//  Created by GÜRHAN YUVARLAK on 18.10.2022.
//

import UIKit

final class SearchViewController: UIViewController {

    //MARK: - Properties
    private let viewModel: SearchViewModel
    
    
    //MARK: - Init
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.navigationItem.hidesBackButton = true
        
    }

    // MARK: - Methods

}
