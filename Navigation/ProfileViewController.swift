//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Denis Evdokimov on 10/17/21.
//

import UIKit

class ProfileViewController: UIViewController {
    init(){
        super.init(nibName: nil, bundle: nil)
        configureTabBarItem()
      
    }
    
    required init(coder aDecoder: NSCoder) {
            fatalError("NSCoding not supported")
        }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green
    }
    
    func configureTabBarItem() {
        tabBarItem.title = "Profile"
        tabBarItem.image = UIImage(systemName: "person")
        tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        tabBarItem.tag = 1
    }

}
