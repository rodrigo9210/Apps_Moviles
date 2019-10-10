//
//  File.swift
//  Posesionista
//
//  Created by Arce Anguiano Rodrigo Roberto on 10/9/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import Foundation

class Cosa : NSObject {
    
    var nombre :  String = ""
    var valorEnPesos : Int
    var numeroDeSerie : String?
    let fechaDeCreacion : Date
    
    init(nombre: String, valor: Int, serie: String?, alta: Date) {
        self.nombre = nombre
        self.valorEnPesos = valor
        self.numeroDeSerie = serie
        self.fechaDeCreacion = alta
        super.init()
    }
    
    override convenience init(){
        let sustantivos = ["aguacate", "termo", "audifonos"]
        let adjetivos = ["verde", "viejo", "caro"]
        
        let nombreAleatorio = "\(sustantivos.randomElement()!) \(adjetivos.randomElement()!)"
        let valorAleatorio = Int.random(in: 0...100)
        let serieAleatorio = UUID().uuidString.components(separatedBy: "-").first!
        
        self.init(nombre: nombreAleatorio, valor: valorAleatorio, serie:serieAleatorio, alta: Date())
    }
    
}//class Cosa
