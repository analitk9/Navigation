//
//  LogInViewController.swift
//  Navigation
//
//  Created by Denis Evdokimov on 11/3/21.
//

import UIKit

class LogInViewController: UIViewController {
    
    private var keyboardHelper: KeyboardHelper?
    let loginView = LogInView()
    
    let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
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
        navigationController?.navigationBar.isHidden = true
    
        view.addSubview(scrollView)
        scrollView.addSubview(loginView)
        
        loginView.logInButton.addTarget(self, action: #selector(loginButtonPress), for: .touchUpInside)
        loginView.loginText.delegate = self
        loginView.passwordText.delegate = self
       
        keyboardHelper = KeyboardHelper { [unowned self] animation, keyboardFrame, duration in
            switch animation {
            case .keyboardWillShow:
                scrollView.contentOffset = CGPoint(x: 0, y: keyboardFrame.size.height/2 )
            case .keyboardWillHide:
                scrollView.contentOffset = .zero
            }
        }
    }
    
    override func viewWillLayoutSubviews() {
        configureLayout()
    }
    
    func configureLayout(){
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        loginView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        loginView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        loginView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        loginView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        loginView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        loginView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor).isActive = true
    }
    
    func configureTabBarItem() {
        tabBarItem.title = "Profile"
        tabBarItem.image = UIImage(systemName: "person")
        tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        tabBarItem.tag = 20
    }

    @objc func loginButtonPress() {
        let profileVC = ProfileViewController()
        
        navigationController?.pushViewController(profileVC, animated: true)
        
    }
    
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
