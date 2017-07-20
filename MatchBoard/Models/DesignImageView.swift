//
//  DesignImageView.swift
//  MatchBoard
//
//  Created by Talentelgia on 02/02/16.
//  Copyright © 2016 Talentelgia. All rights reserved.
//

import UIKit

@IBDesignable class DesignImageView: UIImageView {

    @IBInspectable var borderColor: UIColor = UIColor.clearColor() {
        didSet {
            layer.borderColor = borderColor.CGColor
        }
        
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
        
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
        
    }
    
    @IBInspectable var masksToBounds: Bool = false {
        didSet {
            layer.masksToBounds = masksToBounds
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
