//
//  PaddingLabel.swift
//  Navigation
//
//  Created by Denis Evdokimov on 11/8/21.
//

import UIKit

class PaddingLabel: UILabel {
    
    var padding: UIEdgeInsets = .zero
   
    override func drawText(in rect: CGRect) {
            super.drawText(in: rect.inset(by: padding))
    }

}
