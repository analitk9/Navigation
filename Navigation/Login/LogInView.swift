//
//  LoginView.swift
//  Navigation
//
//  Created by Denis Evdokimov on 11/3/21.
//

import UIKit

class LogInView: UIView {
    
    let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 0
        stack.layer.cornerRadius = 10
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        stack.clipsToBounds = true
        return stack
    }()

    let logoView: UIImageView = {
        let image = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: 100, height: 100)))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.image = UIImage(named: "logo")
        image.layer.cornerRadius = 15
        return image
        
    }()
    
    let logInButton: UIButton = {
        let but = UIButton()
        but.translatesAutoresizingMaskIntoConstraints = false
        but.setTitle("Log in", for: .normal)
        but.tintColor = .white
        let pixelImage = UIImage(named: "bluePixel")
        but.setBackgroundImage(pixelImage?.withAlpha(1.0), for: .normal)
        but.setBackgroundImage(pixelImage?.withAlpha(0.8), for: .highlighted)
        but.setBackgroundImage(pixelImage?.withAlpha(0.8), for: .selected)
        but.setBackgroundImage(pixelImage?.withAlpha(0.8), for: .disabled)
        but.clipsToBounds = true
        but.layer.cornerRadius = 10
        return but
    }()
    
    let loginText: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.layer.borderColor = UIColor.lightGray.cgColor
        login.layer.borderWidth = 0.5
        login.placeholder = "Email or phone"
        login.textColor = .black
        login.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        login.tintColor =  .lightGray
        login.autocapitalizationType = .none
        login.backgroundColor = .systemGray6
        login.returnKeyType = .done
        login.indent(size: 10)
        
        return login
    }()
    
    
    let passwordText: UITextField = {
        let pass = UITextField()
        pass.translatesAutoresizingMaskIntoConstraints = false
        pass.layer.borderColor = UIColor.lightGray.cgColor
        pass.layer.borderWidth = 0.5
        pass.placeholder = "Password"
        pass.textColor = .black
        pass.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        pass.tintColor =  .lightGray
        pass.autocapitalizationType = .none
        pass.backgroundColor = .systemGray6
        pass.isSecureTextEntry = true
        pass.returnKeyType = .done
        pass.indent(size: 10)
        
        return pass
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
       
        addSubview(stack)
        
        addSubview(logoView)
        
        stack.addArrangedSubview(loginText)
        stack.addArrangedSubview(passwordText)

        
        addSubview(logInButton)

    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureLayout()
    }
    
    func configureLayout(){
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            loginText.heightAnchor.constraint(equalToConstant: 50),
            passwordText.heightAnchor.constraint(equalToConstant: 50),
            stack.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stack.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 120),
            stack.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logInButton.leadingAnchor.constraint(equalTo: stack.leadingAnchor),
            logInButton.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: stack.trailingAnchor)
            
        ])
        
        
        
        
    }
    

}