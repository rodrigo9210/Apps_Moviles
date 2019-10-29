//
//  InventarioDeImagenes.swift
//  Posesionista
//
//  Created by Arce Anguiano Rodrigo Roberto on 10/23/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit

class InventarioDeImagenes {
    
    let cache = NSCache<NSString, UIImage>()
    
    func setImagen(imagen: UIImage, paraLaLLave llave: String){
        cache.setObject(imagen, forKey: llave as NSString)
        let url = urlDeImagenEnDisco(paraLlave: llave)
        if let data = imagen.jpegData(compressionQuality: 0.5) {
            try? data.write(to: url, options: [.atomic])
        }
    }
    
    func borraImagen(paraLaLLave llave: String){
        cache.removeObject(forKey: llave as NSString)
        try? FileManager.default.removeItem(at: urlDeImagenEnDisco(paraLlave: llave))
    }
    
    func getImagen(paraLaLLave llave: String) -> UIImage?{
        if let imagenExistente = cache.object(forKey: llave as NSString) {
            return imagenExistente
        }
        
        let url = urlDeImagenEnDisco(paraLlave: llave)
        guard let imagenEnDisco = UIImage(contentsOfFile: url.path) else {
            return nil
        }
        
        cache.setObject(imagenEnDisco, forKey: llave as NSString)
        return imagenEnDisco
    }
    
    func urlDeImagenEnDisco(paraLlave llave: String) -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(llave)
    }
    
}//CLASS
