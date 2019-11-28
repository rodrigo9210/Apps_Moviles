//
//  Foto.swift
//  Flickr
//
//  Created by Arce Anguiano Rodrigo Roberto on 11/25/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import Foundation

class Foto {
    let titulo: String
    let urlRemoto: URL
    let idDeFoto : String
    let fechaTomada: Date
    
    init(titulo: String, urlRemoto: URL, idDeFoto: String, fechaTomada: Date) {
        self.fechaTomada = fechaTomada
        self.idDeFoto = idDeFoto
        self.titulo = titulo
        self.urlRemoto = urlRemoto
    }
    
}
