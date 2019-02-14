//
//  UIImage+Extension.swift
//  传值demotest
//
//  Created by 万想想 on 2019/1/15.
//  Copyright © 2019年 万想想. All rights reserved.
//

import UIKit
extension UIImage{
    
    func setImageCorner(byRoundingCorners: UIRectCorner = UIRectCorner.allCorners, cornerRadi: CGFloat,imageSize:CGSize) -> UIImage? {
        return roundImage(byRoundingCorners: byRoundingCorners, cornerRadii: CGSize(width: cornerRadi, height: cornerRadi),imageSize:imageSize)
    }
    
    func roundImage(byRoundingCorners: UIRectCorner = UIRectCorner.allCorners, cornerRadii: CGSize,imageSize:CGSize) -> UIImage? {
        
        let imageRect = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        UIGraphicsBeginImageContextWithOptions(imageSize, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        guard context != nil else {
            return nil
        }
        context?.setShouldAntialias(true)
        let bezierPath = UIBezierPath(roundedRect: imageRect,
                                      byRoundingCorners: byRoundingCorners,
                                      cornerRadii: cornerRadii)
        bezierPath.close()
        bezierPath.addClip()
        self.draw(in: imageRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    func circleImage() -> UIImage?{
        
        UIGraphicsBeginImageContextWithOptions(self.size, false, 1.0)
        let ctx = UIGraphicsGetCurrentContext()
        guard ctx != nil else {
            return nil
        }
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        ctx?.addEllipse(in: rect)
        ctx?.clip()
        draw(in: rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
        
    }
}
