//
//  TragaPerras.swift
//  BlackDice
//
//  Created by Alumne on 10/5/18.
//  Copyright © 2018 ErikyGerard. All rights reserved.
//

import Foundation

class TragaPerras {
    let array: [Int] = [0, 1, 2, 3]
    var icones: [Int]?
    var puntuacio:Int = 0
    var button1:Bool = false
    var button2:Bool = false
    var button3:Bool = false
    var fichas:Int = 0
    var dinero:Int = 0 
    init(){
     
    }
    
    func gastarFicha() {
        fichas = fichas - 1
        UserDefaults.standard.set(fichas, forKey: "fichas")
    }
    
}
