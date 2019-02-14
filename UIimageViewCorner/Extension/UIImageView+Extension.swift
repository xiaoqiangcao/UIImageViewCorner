//
//  UIImageView+Extension.swift
//  传值demotest
//
//  Created by 万想想 on 2019/1/15.
//  Copyright © 2019年 万想想. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView{
    
    /// 使用Core Graphics框架画出一个圆角
    func setCornerImage(){
        
        //1.建立上下文
        
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 0)
        
        //获取当前上下文
        let ctx = UIGraphicsGetCurrentContext()
        
        //设置填充颜色
        UIColor.white.setFill()
        UIRectFill(self.bounds)
        
        //2.添加圆及裁切
        ctx?.addEllipse(in: self.bounds)
        //裁切
        ctx?.clip()
        
        //3.绘制图像
        self.draw(self.bounds)
        
        //4.获取绘制的图像
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        //5关闭上下文
        UIGraphicsEndImageContext()
        
        DispatchQueue.main.async(execute: {
            self.image = image
        })
        
    }
    
    /// 使用贝塞尔曲线UIBezierPath和Core Graphics框架画出一个圆角
    func setGraphicsCornerImage(){
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 1.0)
        let path = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: self.bounds.size)
        path.addClip()
        self.draw(self.bounds)
        self.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    /// 使用CAShapeLayer和UIBezierPath设置圆角
    func setLayerCornerImage(){
        let path = UIBezierPath.init(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: self.bounds.size)
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = self.bounds
        maskLayer.path = path.cgPath
        self.layer.mask = maskLayer
    }
    
}
