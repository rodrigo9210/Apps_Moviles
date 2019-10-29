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
    let rutaDelInventarioEnElDisco : URL = {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("cosas.archivo")
    }()
    
    init() {
        do {
            let data = try Data(contentsOf: self.rutaDelInventarioEnElDisco)
            do {
                let cosasGuardadas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
                self.todasLasCosas = cosasGuardadas as! [Cosa]
            } catch {
                print("Error al deserializar los datos \(error.localizedDescription)")
            }
        } catch {
            print("Error al leer del disco \(error.localizedDescription)")
        }
    }
    
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
    
    func guardaEnDisco() -> Bool {
        print("El inventario se guardara en: \(self.rutaDelInventarioEnElDisco.path)")
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self.todasLasCosas, requiringSecureCoding: false) //2. Serializar
            do {
                try data.write(to: self.rutaDelInventarioEnElDisco, options: [.atomic]) // las funciones atomicas no se interrumpen NUNCA
                return true
            } catch {
                print("Error al guardar a disco \(error.localizedDescription)")
            }
        } catch {
            print("Error al serializar el inventario: \(error.localizedDescription)")
        }
        return false
    }
    
    
}
