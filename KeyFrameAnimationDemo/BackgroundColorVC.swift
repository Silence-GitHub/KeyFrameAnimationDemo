//
//  BackgroundColorVC.swift
//  KeyFrameAnimation
//
//  Created by Kaibo Lu on 2017/2/12.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class BackgroundColorVC: UIViewController {

    private var layer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Path"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(start))
        view.backgroundColor = .white
        
        layer = CALayer()
        layer.frame = view.bounds
        layer.backgroundColor = UIColor.blue.cgColor
        view.layer.addSublayer(layer)
    }
    
    @objc private func start() {
        let animation = CAKeyframeAnimation(keyPath: "backgroundColor")
        animation.values = [UIColor.blue.cgColor, UIColor.yellow.cgColor, UIColor.red.cgColor, UIColor.green.cgColor]
        animation.keyTimes = [0, 0.6, 0.9, 1]
        animation.duration = 6
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        layer.add(animation, forKey: "")
    }
    
}
