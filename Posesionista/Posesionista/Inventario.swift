//
//  Inventario.swift
//  Posesionista
//
//  Created by Arce Anguiano Rodrigo Roberto on 10/9/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import Foundation

class Inventario {
    var todasLasCosas = [Cosa]()
    
    @discardableResult func creaCosa() -> Cosa {
        self.todasLasCosas.append(Cosa())
        return todasLasCosas.last!
    }
    
    init(){
        for _ in 0..<5 {
            creaCosa()
        }
    }
}
