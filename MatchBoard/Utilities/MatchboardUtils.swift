//
//  MatchboardUtils.swift
//  Matchboard
//
//  
//  Copyright © 2015 ImagineME. All rights reserved.
//

import Foundation
import UIKit

class MatchboardUtils {
    
    static func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    static func cornerRadius() -> CGFloat
    {
        return 4.0
    }
    
}