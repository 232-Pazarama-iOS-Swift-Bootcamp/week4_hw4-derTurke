//
//  ProfileSettingsViewController.swift
//  FlickrApi
//
//  Created by GÜRHAN YUVARLAK on 19.10.2022.
//

import UIKit

final class ProfileSettingsViewController: UIViewController {
    //MARK: - Properties
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    //MARK: - Init

    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - Methods

    @IBAction func didTapSaveButton(_ sender: UIButton) {
    }
}
