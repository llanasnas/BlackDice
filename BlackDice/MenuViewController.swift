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
    
        let fichas:Int = defaults.integer(forKey: "fichas")
        let dinero:Int =  defaults.integer(forKey: "dinero")
        fichasLabel.text = String(fichas)
        dineroLabel.text = String(dinero)
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var fichasLabel: UILabel!
    @IBOutlet weak var dineroLabel: UILabel!
    
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
