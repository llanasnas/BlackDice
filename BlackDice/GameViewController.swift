//
//  ViewController.swift
//  BlackDice
//
//  Created by Alumne on 12/4/18.
//  Copyright © 2018 ErikyGerard. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var photo: Array<UIImage>=[]
    let randomLimitNum:Int = Int(arc4random_uniform(24) + 7)
    var punts = 0
    var otherPunts = 0
    

    @IBOutlet weak var otherScore: UILabel!
    @IBOutlet weak var myScore: UILabel!
    @IBOutlet weak var imageDice1: UIImageView!
    @IBOutlet weak var imageDice2: UIImageView!
    @IBOutlet weak var imageDice3: UIImageView!
    @IBOutlet weak var imageDice4: UIImageView!
    @IBOutlet weak var limitNumber: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    
    
    
 
    
    @IBAction func prueba(_ sender: UIPanGestureRecognizer) {
        switch sender.view {
        case imageDice1?:
            if sender.state == .ended{
                if let dice1 = imageDice1 {
                    punts = punts + Int(arc4random_uniform(6) + 1)
                    print("1")
                    diceAnimation(imagen: dice1)
                }
            }
        case imageDice2?:
            if sender.state == .ended{
                if let dice2 = imageDice2 {
                    
                    print("2")
                }
            }
        case imageDice3?:
            if sender.state == .ended{
                if let dice3 = imageDice3 {
                    punts = punts + Int(arc4random_uniform(6) + 1)
                    print("3")
                }
            }
        case imageDice4?:
            if sender.state == .ended{
                if let dice4 = imageDice4 {
                    punts = punts + Int(arc4random_uniform(6) + 1)
                    print("4")
                }
            }
            
            
            
        default:
            print("adeu")
        }
    }
    
    func pan(gesture:UIPanGestureRecognizer){
        switch gesture.state {
        case .changed:
           print("hola")
        default:
            break
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        limitNumber.text = String(randomLimitNum)
        for index in 1...6{
            let name:String="dice\(index)"
            var image:UIImage=UIImage(named:name)!
            photo.append(image)
        }
        
       
    }
    @IBAction func stopDice(_ sender: UITapGestureRecognizer) {
        
        switch sender.view {
        case imageDice1?:
            if sender.state == .ended{
                if let dice1 = imageDice1 {
                   diceAnimatioStop(imagen: dice1)
                }
            }
        case imageDice2?:
            if sender.state == .ended{
                if let dice2 = imageDice2 {
                    
                    print("2")
                }
            }
        case imageDice3?:
            if sender.state == .ended{
                if let dice3 = imageDice3 {
                    punts = punts + Int(arc4random_uniform(6) + 1)
                    print("3")
                }
            }
        case imageDice4?:
            if sender.state == .ended{
                if let dice4 = imageDice4 {
                    punts = punts + Int(arc4random_uniform(6) + 1)
                    print("4")
                }
            }
            
            
            
        default:
            print("adeu")
        }
        }
func diceAnimatioStop(imagen: UIImageView){
    
    imagen.stopAnimating()
    UIViewPropertyAnimator.runningPropertyAnimator(
        withDuration: 1,
        delay: 0,
        options: .curveLinear,
        animations: {
            imagen.alpha=0
    }, completion: {finished in
        let imagePoints = Int(arc4random_uniform(5) + 1)
        let other = Int(arc4random_uniform(5) + 1)
        self.punts = self.punts + imagePoints+1
        self.otherPunts = self.otherPunts + other
        imagen.image=self.photo[imagePoints]
        let animator = UIViewPropertyAnimator(
            duration: 1,
            curve: UIViewAnimationCurve.linear,
            animations: {
                imagen.alpha=1
        }
        )
        animator.startAnimation()
        self.myScore.text = String(self.punts)
    })
    
}
    func diceAnimation(imagen : UIImageView){
        
        imagen.animationImages=self.photo
        imagen.animationDuration=1.5
        imagen.animationRepeatCount=0
        imagen.startAnimating()
        

        
        
        
        
    }
    func myDelayedFunction(image: UIImageView) {
        let imagePoints = Int(arc4random_uniform(5) + 1)
        image.image=photo[imagePoints]
        print("delayed")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

