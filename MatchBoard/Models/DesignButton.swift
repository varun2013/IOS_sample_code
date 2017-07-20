//
//  DesignButton.swift
//  MatchBoard
//
//  Created by Talentelgia on 02/02/16.
//  Copyright © 2016 Talentelgia. All rights reserved.
//

import UIKit

@IBDesignable class DesignButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

}
