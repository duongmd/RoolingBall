//
//  ViewController.swift
//  RunningBall
//
//  Created by Student on 9/19/16.
//  Copyright © 2016 MD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var ball = UIImageView()
    var radians = CGFloat()
    var ballRadius = CGFloat()
    var goRight = true
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        let time = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(rollBall), userInfo: nil, repeats: true)
    }

    func addBall(){
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball"))
        ballRadius = 32.0
        
        ball.center = CGPoint(x: ballRadius, y: mainViewSize.height * 0.5)
        self.view.addSubview(ball)
    }

    func rollBall(){
        var deltaAngle: CGFloat = 0.1
        
        if (goRight == false) {
            deltaAngle = -0.1
        }
        if (ball.center.x + 32) > self.view.bounds.size.width {
            goRight = false
        }
        if (ball.center.x - 32) < 0 {
            goRight = true
        }
        
        radians = radians + deltaAngle      //Moi lan chay ham tang len 1 goc
        ball.transform = CGAffineTransform(rotationAngle: radians)     // quay 1 goc
        ball.center = CGPoint(x: ball.center.x + ballRadius * deltaAngle, y: ball.center.y)   //di chuyen 1 khoang
    }
}

