//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Denis Evdokimov on 11/7/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private lazy var titleTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
       // label.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        return label
    }()
    
    private lazy var postImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
       // label.padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return label
    }()
    
    private lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleTextLabel)
        contentView.addSubview(postImage)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likeLabel)
        contentView.addSubview(viewsLabel)
        
      
    }
    
    override func layoutSubviews() {
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLayout() {
        titleTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        titleTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        titleTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        postImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        postImage.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
        postImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        postImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        postImage.topAnchor.constraint(equalTo: titleTextLabel.bottomAnchor, constant: 16).isActive = true

        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor,constant: 16).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        likeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        likeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16).isActive = true
        likeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16).isActive = true
        
        viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16).isActive = true
        viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16).isActive = true
        viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16).isActive = true
       
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleTextLabel.text =  nil
        postImage.image = nil
        likeLabel.text = nil
        viewsLabel.text = nil
        descriptionLabel.text = nil
    }
    
    func configure(_ post: Post) {
        titleTextLabel.text = post.title
        postImage.image = UIImage(named: post.image)
        likeLabel.text = "Likes: \(String(post.likes))"
        viewsLabel.text = "Views: \(String(post.views))"
        descriptionLabel.text = String(post.description)
        layoutSubviews()
    }
    
}
