//
//  File.swift
//  Posesionista
//
//  Created by Arce Anguiano Rodrigo Roberto on 10/9/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import Foundation

class Cosa : NSObject, NSCoding {
    
    var nombre : String = ""
    var valorEnPesos : Int
    var numeroDeSerie : String?
    let fechaDeCreacion : Date
    let llaveCosa : String
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.nombre, forKey: "nombre")
        aCoder.encode(self.valorEnPesos, forKey: "valorEnPesos")
        aCoder.encode(self.numeroDeSerie, forKey: "numeroDeSerie")
        aCoder.encode(self.fechaDeCreacion, forKey: "fechaDeCreacion")
        aCoder.encode(self.llaveCosa, forKey: "llaveCosa")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.nombre = aDecoder.decodeObject(forKey: "nombre") as! String
        self.valorEnPesos = aDecoder.decodeInteger(forKey: "valorEnPesos")
        self.numeroDeSerie = aDecoder.decodeObject(forKey: "numeroDeSerie") as! String?
        self.fechaDeCreacion = aDecoder.decodeObject(forKey: "fechaDeCreacion") as! Date
        self.llaveCosa = aDecoder.decodeObject(forKey: "llaveCosa") as! String
        super.init()
    }
    
    init(nombre: String, valor: Int, serie: String?, alta: Date) {
        self.nombre = nombre
        self.valorEnPesos = valor
        self.numeroDeSerie = serie
        self.fechaDeCreacion = alta
        self.llaveCosa = UUID().uuidString
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
