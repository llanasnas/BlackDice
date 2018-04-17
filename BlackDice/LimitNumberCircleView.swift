//
//  LimitNumberCircleView.swift
//  BlackDice
//
//  Created by Alumne on 12/4/18.
//  Copyright © 2018 ErikyGerard. All rights reserved.
//

import UIKit
@IBDesignable
class LimitNumberCircleView: UIView {

    
    @IBInspectable
    var circleScale: CGFloat = 0.90
    
    @IBInspectable
    var circleCenter : CGPoint {return CGPoint(x:bounds.midX,y:bounds.midY)}
    @IBInspectable
    var circleRadius : CGFloat {return circleScale*min (bounds.size.width,bounds.size.height) / 2 }
    
    @IBInspectable
    var circleLineWidth : CGFloat = 5.0
    
    @IBInspectable
    var circleColor:UIColor = UIColor.black
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
     */
    override func draw(_ rect: CGRect) {
        
        //let circleRadius = min (bounds.size.width, bounds.size.height)
        let path = UIBezierPath(arcCenter: circleCenter, radius: circleRadius, startAngle: 0, endAngle:CGFloat(2*Double.pi), clockwise:true)
        path.lineWidth = circleLineWidth
        circleColor.set()
        path.stroke()
        
        
    }
 

}
