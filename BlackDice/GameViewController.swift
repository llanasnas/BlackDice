//
//  ViewController.swift
//  BlackDice
//
//  Created by Alumne on 12/4/18.
//  Copyright © 2018 ErikyGerard. All rights reserved.
//

import UIKit
import AudioToolbox

class GameViewController: UIViewController {
    
    var photo: Array<UIImage>=[]
    var randomLimitNum:Int = Int(arc4random_uniform(24) + 7)
    var punts = 0
    let defaults = UserDefaults.standard
    var otherPunts = 0
    var soundID:SystemSoundID=0;

    @IBOutlet weak var otherScore: UILabel!
    @IBOutlet weak var myScore: UILabel!
    @IBOutlet weak var imageDice1: UIImageView!
    @IBOutlet weak var imageDice2: UIImageView!
    @IBOutlet weak var imageDice3: UIImageView!
    @IBOutlet weak var imageDice4: UIImageView!
    @IBOutlet weak var limitNumber: UILabel!
    @IBOutlet weak var finishButton: UIButton!
 
    
    @IBAction func prueba(_ sender: UIPanGestureRecognizer) {
        AudioServicesPlaySystemSound(soundID)
        switch sender.view {
        case imageDice1?:
            if sender.state == .ended{
                if let dice1 = imageDice1 {
                    
                    print(Int(arc4random_uniform(6) + 1))
                    diceAnimation(imagen: dice1)
                }
            }
        case imageDice2?:
            if sender.state == .ended{
                if let dice2 = imageDice2 {
                    
                    diceAnimation(imagen: dice2)
                    print("2")
                }
            }
        case imageDice3?:
            if sender.state == .ended{
                if let dice3 = imageDice3 {
                    
                    diceAnimation(imagen: dice3)
                    print("3")
                }
            }
        case imageDice4?:
            if sender.state == .ended{
                if let dice4 = imageDice4 {
                    
                    diceAnimation(imagen: dice4)
                    print("4")
                }
            }
            
            
            
        default:
            print("adeu")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
        limitNumber.text = String(randomLimitNum)
        
        if let soundURL=Bundle.main.url(forResource:"dicesound",withExtension: "mp3"){
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundID)
        }
        
        for index in 1...6{
            let name:String="dice\(index)"
            var image:UIImage=UIImage(named:name)!
            photo.append(image)
        }
        
        
    }
    
    func newGame(){
        
        self.randomLimitNum = Int(arc4random_uniform(24) + 7)
        self.punts = 0
        self.otherPunts = 0
        self.myScore.text = String(self.punts)
        self.otherScore.text = String(self.otherPunts)
        self.limitNumber.text = String(self.randomLimitNum)
        self.imageDice1.image = UIImage(named: "finger")
        self.imageDice2.image = UIImage(named: "finger")
        self.imageDice3.image = UIImage(named: "finger")
        self.imageDice4.image = UIImage(named: "finger")
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
                    diceAnimatioStop(imagen: dice2)
                    print("2")
                }
            }
        case imageDice3?:
            if sender.state == .ended{
                if let dice3 = imageDice3 {
                    diceAnimatioStop(imagen: dice3)
                    print("lol 3")
                }
            }
        case imageDice4?:
            if sender.state == .ended{
                if let dice4 = imageDice4 {
                   
                    diceAnimatioStop(imagen: dice4)
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
        print("holas \(imagePoints)")
        self.punts = self.punts + imagePoints+1
        print("Els meus punts \(self.punts)")
        self.otherPunts = self.otherPunts + other+1
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
        self.otherScore.text = String(self.otherPunts)
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listo" {
            let destinationVC = segue.destination as! WinnerViewController
            destinationVC.myPoints = self.punts
            destinationVC.otherPoints = self.otherPunts
            destinationVC.limitNumber = self.randomLimitNum
            
            self.newGame()
        }
    }
}

