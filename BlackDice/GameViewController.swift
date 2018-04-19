//
//  ViewController.swift
//  BlackDice
//
//  Created by Alumne on 12/4/18.
//  Copyright © 2018 ErikyGerard. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    let photo=["dice1","dice2","dice3","dice4","dice5","dice6"]
    let randomLimitNum:Int = Int(arc4random_uniform(24) + 7)
    var punts = 0
    

    @IBOutlet weak var imageDice1: UIImageView!
    @IBOutlet weak var imageDice2: UIImageView!
    @IBOutlet weak var imageDice3: UIImageView!
    @IBOutlet weak var imageDice4: UIImageView!
    @IBOutlet weak var limitNumber: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var otherScore: UIView!
    @IBOutlet weak var myScore: UIView!
    
 
    
    @IBAction func prueba(_ sender: UIPanGestureRecognizer) {
        switch sender.view {
        case imageDice1?:
            if sender.state == .ended{
                if let dice1 = imageDice1 {
                    punts = punts + Int(arc4random_uniform(6) + 1)
                    print("1")
                    
                    
                    
                    
                }
            }
        case imageDice2?:
            if sender.state == .ended{
                if let dice2 = imageDice2 {
                    punts = punts + Int(arc4random_uniform(6) + 1)
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
        
       
    }
    func diceAnimation(imagen : UIImageView){
        
        var imagesArray:Array<UIImage>=[]
        for index in 1...6{
            let name:String="dice\(index)"
            let image:UIImage=UIImage(named:name)!
            imagesArray.append(image)
        }
        //imagen=UIImageView(frame: CGRectMake(self.view.frame.width/2-imagen./))
        //imagen.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

