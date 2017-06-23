//
//  MaterialView.swift
//  MakeSchool Notes
//
//  Created by Fernando on 3/25/17.
//  Copyright © 2017 Specialist. All rights reserved.
//

import UIKit

private var materialKey = false

extension UITextField {
    
    @IBInspectable var textFieldStyle: Bool {
        get {
            return materialKey
        } set {
            materialKey = newValue
            
            if materialKey {
                
                let grayColor = UIColor(red: 152/255, green: 152/255, blue: 152/255, alpha: 1.0).cgColor

                let border = CALayer()
                let width = CGFloat(1.3)
                border.borderColor = UIColor(red: 125/255, green: 85/255, blue: 251/255, alpha: 1.0).cgColor
                border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
                
                border.borderWidth = width
                self.layer.addSublayer(border)
                self.layer.masksToBounds = true
                
//                let placeholderText = "Enter title"
//                let placeHolder = NSMutableAttributedString(string: placeholderText, attributes: [NSFontAttributeName:UIFont(name: "Avenir Next", size: 15.0)!])
//
////                 Set the color
//                placeHolder.addAttribute(NSForegroundColorAttributeName, value: grayColor, range:NSRange(location:0,length:placeholderText.characters.count))
                

//                self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSForegroundColorAttributeName: true, value: grayColor])

                
                
            } else {
                
            }
        }
    }
    
}
