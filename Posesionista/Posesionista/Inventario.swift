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
    
    func eliminaCosa(cosaAELiminar: Cosa){
        if let indiceDeCosa = todasLasCosas.firstIndex(of: cosaAELiminar) {
            todasLasCosas.remove(at: indiceDeCosa)
        }
        
    }
    
    func reordena(de: Int, hacia: Int){
        if de == hacia {
            return
        }
        
        let cosaAMover = todasLasCosas[de]
        todasLasCosas.remove(at: de)
        todasLasCosas.insert(cosaAMover, at: hacia)
    }
//    init(){
//        for _ in 0..<5 {
//            creaCosa()
//        }
//    }
}
