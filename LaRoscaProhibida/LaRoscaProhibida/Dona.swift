//
//  Dona.swift
//  LaRoscaProhibida
//
//  Created by Arce Anguiano Rodrigo Roberto on 11/11/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit
import CoreMotion

class Dona: UIView {
    var aceleracion = CMAcceleration(x: 0, y: 0, z: 0)
    let imagen = UIImage(named: "dona.png")
    var posicionActual = CGPoint.zero {
        didSet {
            var nuevaX = self.posicionActual.x
            var nuevaY = self.posicionActual.y
            if nuevaX < 0 {
                nuevaX = 0
//                velocidadX = 0
                velocidadX = -(velocidadX / 2)
            } else if nuevaX > bounds.size.width - self.imagen!.size.width {
                nuevaX =  bounds.size.width - self.imagen!.size.width
                velocidadX = -(velocidadX / 2)
            }
            
            if nuevaY < 0 {
                nuevaY = 0
//                velocidadY = 0
                velocidadY = -(velocidadY / 2)
            } else if nuevaY > bounds.size.height - self.imagen!.size.height {
                nuevaY =  bounds.size.height - self.imagen!.size.height
                velocidadY = -(velocidadY / 2)
            }
            
            self.posicionActual = CGPoint(x: nuevaX, y: nuevaY)
            
            let rectActual = CGRect(origin: self.posicionActual, size: CGSize(width: nuevaX + self.imagen!.size.width, height: nuevaY + self.imagen!.size.height))
            let rectAnterior = CGRect(x: oldValue.x, y: oldValue.y, width: oldValue.x + self.imagen!.size.width, height: oldValue.y + self.imagen!.size.height)
            setNeedsDisplay(rectActual.union(rectAnterior))
        }
    }
    
    var velocidadX = 0.0
    var velocidadY = 0.0
    var ultimaActualizacion = Date()
    let puntosPorSegundo = 500.0
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        inicializaVista()
    }
    
    func inicializaVista() {
        self.posicionActual = CGPoint(x: self.bounds.midX - self.imagen!.size.width/2, y: self.bounds.midY - self.imagen!.size.height/2)
    }
    
    func actualizaPosicion() {
        let ahora = Date()
        let segundosDesdeUltimaActualizacion = ahora.timeIntervalSince(self.ultimaActualizacion)
        self.velocidadX += self.aceleracion.x * segundosDesdeUltimaActualizacion
        self.velocidadY -= self.aceleracion.y * segundosDesdeUltimaActualizacion
        let cambioPosicionX = velocidadX * segundosDesdeUltimaActualizacion * puntosPorSegundo
        let cambioPosicionY = velocidadY * segundosDesdeUltimaActualizacion * puntosPorSegundo
        self.posicionActual = CGPoint(x: posicionActual.x + CGFloat(cambioPosicionX), y: posicionActual.y + CGFloat(cambioPosicionY))
        self.ultimaActualizacion = ahora
    }
    
    override func draw(_ rect: CGRect) {
        self.imagen?.draw(at: posicionActual)
    }
}
