//
//  MenuViewController.swift
//  BlackDice
//
//  Created by Alumne on 8/5/18.
//  Copyright © 2018 ErikyGerard. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
	let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //defaults.set(100, forKey: "fichas")
        actualizeLabels()
        // Do any additional setup after loading the view.
    }
    func actualizeLabels(){
        
        dineroLabel.text = String(defaults.integer(forKey: "diners"))
        fichasLabel.text = String(defaults.integer(forKey: "fichas"))
        
        
    }

    @IBAction func retirarDiners(_ sender: Any) {
        
        defaults.set(0, forKey: "diners")
        actualizeLabels()
        
    }
    @IBOutlet weak var fichasLabel: UILabel!
    @IBOutlet weak var dineroLabel: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
      actualizeLabels()
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
