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
        scroll.keyboardDismissMode = .onDrag
        
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
                scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.size.height/2, right: 0)
            case .keyboardWillHide:
                scrollView.contentOffset = .zero
                scrollView.scrollIndicatorInsets = .zero
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print(scrollView.contentSize)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureLayout()
    }
    
    func configureLayout(){
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
        loginView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        loginView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        loginView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        loginView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        loginView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        loginView.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true

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
