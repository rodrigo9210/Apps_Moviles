//
//  Clases.swift
//  Examen
//
//  Created by Arce Anguiano Rodrigo Roberto on 9/26/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import Foundation

struct Pueblo {
    var poblacion : Int {
        didSet {
            print("Murieron \(oldValue - self.poblacion)")
        }
    }
    
    func cuantosQuedan() {
        print(self.poblacion)
    }
    
    mutating func cambiaPoblacion(cuantos cantidad: Int){
        if (self.poblacion + cantidad) < 0 {
            self.poblacion = 0
        } else {
            self.poblacion += cantidad
        }
    }
}

class Monstruo {
    var pueblo : Pueblo?
    var nombre : String
    
    init (nombre : String, pueblo : Pueblo) {
        self.nombre = nombre
        self.pueblo = pueblo
    }
    
    func aterrorizaCiudad() {
        if self.pueblo != nil {
            print("\(nombre) esta aterrorizando un pueblo")
        } else {
            print("\(nombre) esta descansando")
        }
    }
}

class Zombie: Monstruo {
    var cojea : Bool
    
    init(cojea: Bool, nombre: String, pueblo: Pueblo){
        self.cojea = cojea
        super.init(nombre: nombre, pueblo: pueblo)
    }
    
    override func aterrorizaCiudad() {
        self.pueblo?.cambiaPoblacion(cuantos: -10)
        super.aterrorizaCiudad()
    }
}
