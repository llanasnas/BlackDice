//
//  TragaPerrasViewController.swift
//  BlackDice
//
//  Created by Alumne on 10/5/18.
//  Copyright © 2018 ErikyGerard. All rights reserved.
//

import UIKit

class TragaPerrasViewController: UIViewController {

    var iconos:Array<Icone>=[]
    //var imageArray:Array<UIImage>=[]
    var playing:Bool = false
    var displayLink: Bool = false;
    var tragaperras:TragaPerras = TragaPerras()
    var stepCount:Int = 0
    let defaults = UserDefaults.standard
    var dinersGuanyats:Int = 0
    var counter:Int = 0
    var button1Icone:Icone?
    var button2Icone:Icone?
    var button3Icone:Icone?

    @IBOutlet weak var stopButton1: UIButton!
    @IBOutlet weak var stopButton2: UIButton!
    @IBOutlet weak var stopButton3: UIButton!
    @IBOutlet weak var dineroView: UILabel!
    @IBOutlet weak var fichasView: UILabel!
    @IBOutlet weak var playbutton: UIButton!
    @IBOutlet weak var panel1: UIImageView!
    @IBOutlet weak var panel2: UIImageView!
    @IBOutlet weak var panel3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actualizeLabels()
        areButtonsHidden(areHidden: true)
        var strings = ["lemon","cherry","pickle","smekel","dollar"]
        tragaperras.fichas = defaults.integer(forKey: "fichas")
        tragaperras.dinero = defaults.integer(forKey: "dinero")
        
        
        fichasView.text = String(describing: tragaperras.fichas)
        
        dineroView.text = String(describing: tragaperras.dinero)
        for index in 1...5{
            var image:UIImage=UIImage(named:strings[index-1])!
            var icono = Icone(id:index-1,imagen:image,puntuacion:index*100,nombre:strings[index-1])
            iconos.append(icono)
            //imageArray.append(image)
        }
        
        
        // Do any additional setup after loading the view.
    }
    func actualizeLabels(){
        
        dineroView.text = String(defaults.integer(forKey: "diners"))
        fichasView.text = String(defaults.integer(forKey: "fichas"))        
        
    }

    @IBAction func startGame(_ sender: Any) {
        if(!playing){
            areButtonsHidden(areHidden: false)
            if(defaults.integer(forKey: "fichas")<=0){
                displayAlert(title: "No te quedan fichas!", message:"Juega a Black Dice para conseguir mas")
                areButtonsHidden(areHidden: true)
                
            }else{
            if(!displayLink){
                createDisplayLink()
                displayLink = true
            }
            playing = true
            tragaperras.button1 = true
            tragaperras.button2 = true
            tragaperras.button3 = true
            tragaperras.gastarFicha()
            fichasView.text = String(defaults.integer(forKey: "fichas"))
            
            }
            
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
                rotatePanels(panel: panel1, id: 1)
                
            }            
            if(tragaperras.button2){
                rotatePanels(panel: panel2, id: 2)
                
            }
            if(tragaperras.button3){
                rotatePanels(panel: panel3, id: 3)
                
            }
            
            stepCount = stepCount + 1
            
        }
    }
    
    @IBAction func stopButton1(_ sender: Any) {        
        tragaperras.button1 = false
        checkPanels()
        stopButton1.isHidden = true
    }
    @IBAction func stopButton2(_ sender: Any) {
        tragaperras.button2 = false
        checkPanels()
        stopButton2.isHidden = true
    }
    @IBAction func stopButton3(_ sender: Any) {
        tragaperras.button3 = false
        checkPanels()
        stopButton3.isHidden = true
    }
    func checkPanels(){
        
        if(!tragaperras.button1 && !tragaperras.button2 && !tragaperras.button3){
            
            playing = false;
            if(button1Icone?.nombre == button2Icone?.nombre && button1Icone?.nombre == button3Icone?.nombre){
                
                if(button1Icone?.nombre=="dollar"){
                    
                    dinersGuanyats = 10000
                    displayAlert(title: "Enhorabuena!! ", message: "Has ganado \(dinersGuanyats) €")
                }else{
                    
                    dinersGuanyats = (button1Icone?.puntuacion)! * 3
                    displayAlert(title: "Enhorabuena!! ", message: "Has ganado \(dinersGuanyats) €")
                    
                }
                
            }else if(button1Icone?.nombre == button2Icone?.nombre || button3Icone?.nombre == button2Icone?.nombre){
                
                dinersGuanyats = (button2Icone?.puntuacion)! * 2
                displayAlert(title: "Enhorabuena!! ", message: "Has ganado \(dinersGuanyats) €")
                
            }else{
                
                dinersGuanyats = 0
                displayAlert(title: "Que penaa...", message: "Has ganado \(dinersGuanyats) € :(")
            }
            var totalDiners = dinersGuanyats + defaults.integer(forKey: "diners")
            defaults.set(totalDiners, forKey: "diners")
            dineroView.text = String(totalDiners)
            actualizeLabels()
            
        }
        
    }
    func rotatePanels(panel:UIImageView, id:Int){
        if (stepCount % (4*1) == 0){
            if(counter==5){
                counter=0;
            }
            
            panel.image = iconos[counter].imagen
            switch id {
                case 1:
                button1Icone = iconos[counter]
                case 2:
                button2Icone = iconos[counter]
                default:
                button3Icone = iconos[counter]
            }
            counter = counter + 1
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlert(title:String , message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func areButtonsHidden(areHidden:Bool){
        stopButton1.isHidden = areHidden
        stopButton2.isHidden = areHidden
        stopButton3.isHidden = areHidden
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
