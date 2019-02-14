//
//  ViewController.swift
//  UIimageViewCorner
//
//  Created by 万想想 on 2019/2/14.
//  Copyright © 2019年 wanxiangxiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView1: UIImageView!
    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var imageView3: UIImageView!
    @IBOutlet var imageView4: UIImageView!
    @IBOutlet var imageView5: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView1.setCornerImage()
        imageView2.setLayerCornerImage()
        imageView3.setGraphicsCornerImage()
        
        
        imageView4.image = UIImage.init(named: "1")?.setImageCorner(byRoundingCorners: .allCorners, cornerRadi: 25,imageSize: CGSize(width: 50, height: 50))
        
        imageView5.image = UIImage.init(named: "1")?.circleImage()
        
    }


}

