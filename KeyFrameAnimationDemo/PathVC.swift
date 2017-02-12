//
//  PathVC.swift
//  KeyFrameAnimation
//
//  Created by Kaibo Lu on 2017/2/12.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class PathVC: UIViewController {

    private var layer: CALayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Path"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(start))
        view.backgroundColor = .white
        
        layer = CALayer()
        layer.frame = CGRect(x: 0, y: 300, width: 20, height: 20)
        layer.backgroundColor = UIColor.blue.cgColor
        view.layer.addSublayer(layer)
    }
    
    @objc private func start() {
        let animation = CAKeyframeAnimation(keyPath: "position")
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 300))
        path.addCurve(to: CGPoint(x: 310, y: 300), controlPoint1: CGPoint(x: 110, y: 200), controlPoint2: CGPoint(x: 210, y: 400))
        animation.path = path.cgPath
        animation.duration = 2
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        layer.add(animation, forKey: "")
    }

}
