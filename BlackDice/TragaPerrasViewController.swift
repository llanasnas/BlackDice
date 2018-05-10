//
//  TragaPerrasViewController.swift
//  BlackDice
//
//  Created by Alumne on 10/5/18.
//  Copyright © 2018 ErikyGerard. All rights reserved.
//

import UIKit

class TragaPerrasViewController: UIViewController {

   
    var imageArray:Array<UIImage>=[]
    var playing:Bool = false
    var tragaperras:TragaPerras = TragaPerras()
    var stepCount:Int = 0
    let defaults = UserDefaults.standard
    var counter:Int = 0

    @IBOutlet weak var dineroView: UILabel!
    @IBOutlet weak var fichasView: UILabel!
    @IBOutlet weak var playbutton: UIButton!
    @IBOutlet weak var panel1: UIImageView!
    @IBOutlet weak var panel2: UIImageView!
    @IBOutlet weak var panel3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var strings = ["lemon","cherry","pickle","smekel","dollar"]
        tragaperras.fichas = defaults.integer(forKey: "fichas")
        tragaperras.dinero = defaults.integer(forKey: "dinero")
        fichasView.text = String(describing: tragaperras.fichas)
        
        dineroView.text = String(describing: tragaperras.dinero)
        for index in 1...5{
            var image:UIImage=UIImage(named:strings[index-1])!
            imageArray.append(image)
        }
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func startGame(_ sender: Any) {
        if(!playing){
            createDisplayLink()
            playing = true
            tragaperras.button1 = true
            tragaperras.button2 = true
            tragaperras.button3 = true
            tragaperras.gastarFicha()
            fichasView.text = String(defaults.integer(forKey: "fichas"))
            
        }
        
    }
    func sumarDinero(){
        
        
        
    }
    func createDisplayLink() {
        let displaylink = CADisplayLink(target: self, selector: #selector(rotate))
        
        displaylink.add(to: .current,
                        forMode: .defaultRunLoopMode)
    }
    
    @objc func rotate() {
        if(playing){
            
            if(tragaperras.button1){
                rotatePanels(panel: panel1)
                
            }            
            if(tragaperras.button2){
                rotatePanels(panel: panel2)
                
            }
            if(tragaperras.button3){
                rotatePanels(panel: panel3)
                
            }
            
            stepCount = stepCount + 1
            
        }
    }
    
    @IBAction func stopButton1(_ sender: Any) {        
        tragaperras.button1 = false
        checkPanels()
    }
    @IBAction func stopButton2(_ sender: Any) {
        tragaperras.button2 = false
        checkPanels()
    }
    @IBAction func stopButton3(_ sender: Any) {
        tragaperras.button3 = false
        checkPanels()
    }
    func checkPanels(){
        
        if(!tragaperras.button1 && !tragaperras.button2 && !tragaperras.button3){
            
            playing = false;
            
        }
        
    }
    func rotatePanels(panel:UIImageView){
        if (stepCount % (4*1) == 0){
            if(counter==4){
                counter=0;
            }
            panel.image = imageArray[counter]
            counter = counter + 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
