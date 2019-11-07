//
//  Lugar.swift
//  OnToy
//
//  Created by Arce Anguiano Rodrigo Roberto on 10/31/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import Foundation
import MapKit

class Lugar: NSObject, MKAnnotation{
    
    var coordinate: CLLocationCoordinate2D
    let title: String?
    let subtitle: String?
    
    init(coordenada: CLLocationCoordinate2D, titulo: String?, subtitulo: String?) {
        self.coordinate = coordenada
        self.title = titulo
        self.subtitle = subtitulo
    }
    
}
