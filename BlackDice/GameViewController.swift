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


    @IBOutlet weak var imageDice1: UIImageView!
    @IBOutlet weak var imageDice2: UIImageView!
    @IBOutlet weak var imageDice3: UIImageView!
    @IBOutlet weak var imageDice4: UIImageView!

    @IBOutlet weak var limitNumber: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var otherScore: UIView!
    @IBOutlet weak var myScore: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        limitNumber.text = String(randomLimitNum)
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

