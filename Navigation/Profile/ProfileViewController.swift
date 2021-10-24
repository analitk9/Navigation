//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Denis Evdokimov on 10/17/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileHeaderView: ProfileHeaderView = {
        let headerView = ProfileHeaderView()
        return headerView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configureTabBarItem()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = tabBarItem.title
        view.addSubview(profileHeaderView)
        
        profileHeaderView.statusButton.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
        
        profileHeaderView.statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    }
    
    override func viewWillLayoutSubviews() {
        setupLayout()
    }
    
    func setupLayout() {
        profileHeaderView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        profileHeaderView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func configureTabBarItem() {
        tabBarItem.title = "Profile"
        tabBarItem.image = UIImage(systemName: "person")
        tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        tabBarItem.tag = 20
    }
    
    @objc func statusButtonPressed(){
        if let statusText = profileHeaderView.statusText {
            profileHeaderView.statusTextLabel.text = statusText
        }
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        profileHeaderView.statusText = textField.text
    }
    
}

