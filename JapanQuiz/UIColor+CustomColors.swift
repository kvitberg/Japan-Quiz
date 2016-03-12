//
//  UIColor+CustomColors.swift
//  JapanQuiz
//
//  Created by Scott  on 12/03/16.
//  Copyright © 2016 ScottKvitberg. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    //Blue green
    class func emerald() -> UIColor{
        return UIColor.colorComponents((46,204,113))
    }
    //Green
    class func turquoise() -> UIColor{
        return UIColor.colorComponents((26, 188, 156))
    }
    //Blue
    class func peterRiver() -> UIColor{
        return UIColor.colorComponents((52, 152, 219))
    }
    //Red
    class func alizarin() -> UIColor{
        return UIColor.colorComponents((231, 76, 60))
    }
    
}
//For better use of rgb components
private extension UIColor {
    class func colorComponents(components: (CGFloat, CGFloat, CGFloat)) -> UIColor {
        return UIColor(red: components.0/255, green: components.1/255, blue: components.2/255, alpha: 1)
    }
}