//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Denis Evdokimov on 10/20/21.
//

import UIKit

class ProfileHeaderView: UIView {
    private enum Constans{
        static let padding: CGFloat = 16
        static let avatarViewSideSize: CGFloat = 110
        static let statusButtonHeight: CGFloat = 50
        static let statusTextFieldHeight: CGFloat = 40
        static let statusTextFieldHeightPadding: CGFloat = 34
        
    }
    
    var statusText: String?
    
    let statusTextField: UITextField = {
        let field = StatusTextField(frame: .zero)
        field.configure()
        return field
    }()
    
    let profileAvatarView: UIImageView = {
        let rect = CGRect(x: 0, y: 0, width: Constans.avatarViewSideSize, height: Constans.avatarViewSideSize)
        let image = ProfileAvatarView(frame: rect)
        image.configure()
        return image
    }()
     
    let statusButton: UIButton = {
        let button = StatusButton(frame: .zero)
        button.configure(with: "Show status")
        return button
    }()
    
    let statusTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
        
    }()
    
    let profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hipster Cat"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 199/255, green: 198/255, blue: 205/255, alpha: 1)
        
        addSubview(statusTextLabel)
        addSubview(profileNameLabel)
        addSubview(profileAvatarView)
        addSubview(statusButton)
        addSubview(statusTextField)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureLayout()
    }
    
    func configureLayout(){
        let profileAvatarViewConstraint: [NSLayoutConstraint] = [
            profileAvatarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constans.padding),
            profileAvatarView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constans.padding),
            profileAvatarView.widthAnchor.constraint(equalToConstant: Constans.avatarViewSideSize),
            profileAvatarView.heightAnchor.constraint(equalToConstant: Constans.avatarViewSideSize)
        ]
        
        let statusButtonConstraint: [NSLayoutConstraint] = [
            statusButton.heightAnchor.constraint(equalToConstant: Constans.statusButtonHeight),
            statusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constans.padding),
            statusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constans.padding),
            statusButton.topAnchor.constraint(equalTo: profileAvatarView.bottomAnchor, constant: Constans.padding * 2)
        ]
        
        let profileNameLabelConstraint: [NSLayoutConstraint] = [
            profileNameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            profileNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Constans.padding)
        ]
        
        let statusTextLabelConstraint: [NSLayoutConstraint] = [
            statusTextLabel.leadingAnchor.constraint(equalTo: profileNameLabel.leadingAnchor)
        ]
        
        let statusTextFieldConstraint: [NSLayoutConstraint] = [
            statusTextField.heightAnchor.constraint(equalToConstant: Constans.statusTextFieldHeight),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constans.padding),
            statusTextField.topAnchor.constraint(equalTo: statusTextLabel.bottomAnchor, constant: Constans.padding),
            statusTextField.leadingAnchor.constraint(equalTo: statusTextLabel.leadingAnchor),
            statusTextField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -Constans.statusTextFieldHeightPadding)
        ]
        
        NSLayoutConstraint.activate( profileAvatarViewConstraint +
                                     statusButtonConstraint +
                                     profileNameLabelConstraint +
                                     statusTextLabelConstraint +
                                     statusTextFieldConstraint)
        
    }
    
    
}


