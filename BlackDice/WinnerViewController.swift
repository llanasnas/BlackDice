//
//  WinnerViewController.swift
//  BlackDice
//
//  Created by Alumne on 3/5/18.
//  Copyright © 2018 ErikyGerard. All rights reserved.
//

import UIKit
import AudioToolbox
class WinnerViewController: UIViewController {

    var myPoints:Int = 0
    var otherPoints:Int = 0
    var limitNumber:Int = 0
    let defaults = UserDefaults.standard
    
    var winSoundID:SystemSoundID = 0
    var loseSoundID:SystemSoundID = 0
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let winSoundURL=Bundle.main.url(forResource:"winSound",withExtension: "mp3"){
            AudioServicesCreateSystemSoundID(winSoundURL as CFURL, &winSoundID)
        }
        if let loseSoundURL=Bundle.main.url(forResource:"failSound",withExtension: "mp3"){
            AudioServicesCreateSystemSoundID(loseSoundURL as CFURL, &loseSoundID)
        }
        setGanador()

        // Do any additional setup after loading the view.
    }
    func setGanador(){
        let myFinalPoints = limitNumber-myPoints
        let otherFinalPoints = limitNumber-otherPoints
        
        if(myFinalPoints < 0 && otherFinalPoints < 0){
            self.winnerLabel.text = "EMPATE"
        }
        else if(myFinalPoints < 0 && otherFinalPoints >= 0){
            self.winnerLabel.text = "HAS PERDIDO"
            AudioServicesPlaySystemSound(loseSoundID)
            
        }else if(otherFinalPoints < 0 && myFinalPoints >= 0){
            self.winnerLabel.text = "HAS GANADO 3 FICHAS"
            var totalFichas = defaults.integer(forKey: "fichas");
            
            defaults.set(totalFichas+3, forKey: "fichas")
            AudioServicesPlaySystemSound(winSoundID)
        }else if(myFinalPoints > otherFinalPoints){
            
            self.winnerLabel.text = "HAS PERDIDO"
            AudioServicesPlaySystemSound(loseSoundID)
            
        }else if(myFinalPoints==otherFinalPoints){
            
            self.winnerLabel.text = "EMPATE"
            
        }else{
            

            
            self.winnerLabel.text = "HAS GANADO 3 FICHAS"
            var totalFichas = defaults.integer(forKey: "fichas");
            
            defaults.set(totalFichas+3, forKey: "fichas")
             AudioServicesPlaySystemSound(winSoundID)
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
     @IBOutlet weak var winnerLabel: UILabel!
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
