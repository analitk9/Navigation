//
//  StatusTextField.swift
//  Navigation
//
//  Created by Denis Evdokimov on 10/24/21.
//

import UIKit

extension UITextField {
    
    func indent(size:CGFloat) {
        let rect = CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height)
        self.leftView = UIView(frame: rect)
        self.leftViewMode = .always
    }
    
}



