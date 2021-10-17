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
        createPostButton()
    
    }
    func createPostButton(){
        let button = UIButton(frame: CGRect(x: (view.bounds.width / 2)-50, y: view.bounds.height / 2, width: 100, height: 50))
        button.backgroundColor = .systemRed
        button.setTitle("post", for: .normal)
        button.addTarget(self, action: #selector(pushToPostVC), for: .touchUpInside)
        self.view.addSubview(button)
        
    }
    
    func configureTabBarItem() {
        tabBarItem.title = "Feed"
        tabBarItem.image = UIImage(systemName: "newspaper.circle")
        tabBarItem.selectedImage = UIImage(systemName: "newspaper.circle.fill")
        tabBarItem.tag = 0
        
    }
    
    @objc func pushToPostVC() {
        let postVC = PostViewController()
      
        postVC.curentPost = post
        navigationController?.pushViewController(postVC, animated: true)
        
    }
}
