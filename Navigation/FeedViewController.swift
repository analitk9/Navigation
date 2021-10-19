//
//  FeedViewController.swift
//  Navigation
//
//  Created by Denis Evdokimov on 10/17/21.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post: Post
    
    init(){
        post = Post(title: "Новая Новость!")
        super.init(nibName: nil, bundle: nil)
        configureTabBarItem()
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        title = "Feed"
        createPostButton()
        
    }
    func createPostButton(){
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = button.frame.width / 2
        button.setTitle("post", for: .normal)
        button.addTarget(self, action: #selector(pushToPostVC), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(button)
        
        makeUI(button)
        
    }
    
    func makeUI(_ button: UIButton){
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        button.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    func configureTabBarItem() {
        
        tabBarItem.title = "Feed"
        tabBarItem.image = UIImage(systemName: "newspaper.circle")
        tabBarItem.selectedImage = UIImage(systemName: "newspaper.circle.fill")
        
        tabBarItem.tag = 10
        
    }
    
    @objc func pushToPostVC() {
        let postVC = PostViewController()
        
        postVC.curentPost = post
        navigationController?.pushViewController(postVC, animated: true)
        
    }
}
