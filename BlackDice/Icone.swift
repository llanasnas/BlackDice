//
//  File.swift
//  BlackDice
//
//  Created by Alumne on 15/5/18.
//  Copyright © 2018 ErikyGerard. All rights reserved.
//

import Foundation
import UIKit

class Icone {
    var id:Int
    var imagen:UIImage
    var puntuacion:Int
    var nombre:String
    
    init(id:Int, imagen:UIImage, puntuacion:Int, nombre:String) {
        self.id = id
        self.imagen = imagen
        self.puntuacion = puntuacion
        self.nombre = nombre
    }
    
}
