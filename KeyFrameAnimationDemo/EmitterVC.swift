//
//  EmitterVC.swift
//  KeyFrameAnimationDemo
//
//  Created by Kaibo Lu on 2017/5/12.
//  Copyright © 2017年 Kaibo Lu. All rights reserved.
//

import UIKit

class EmitterVC: UIViewController {

    var emitterLayer: CAEmitterLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Emitter"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start", style: .plain, target: self, action: #selector(start))
        view.backgroundColor = .white

        emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: 150, y: 320)
        emitterLayer.renderMode = kCAEmitterLayerOldestFirst
        emitterLayer.birthRate = 0
        
        let cell = CAEmitterCell()
        cell.birthRate = 5
        cell.lifetime = 1
        cell.velocity = 100
        cell.scale = 0.25
        cell.alphaRange = 1
        cell.alphaSpeed = -1
        
        cell.emissionLongitude = -CGFloat.pi / 2
        cell.emissionRange = CGFloat.pi / 4
        cell.contents = #imageLiteral(resourceName: "Heart").cgImage
        
        emitterLayer.emitterCells = [cell]
        
        
        view.layer.addSublayer(emitterLayer)
    }
    
    @objc private func start() {
        emitterLayer.birthRate = 1
        perform(#selector(end), with: nil, afterDelay: 0.1)
    }
    
    @objc private func end() {
        emitterLayer.birthRate = 0
    }

}
