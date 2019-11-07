//
//  ViewController.swift
//  Sensores
//
//  Created by Arce Anguiano Rodrigo Roberto on 11/6/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var botonEventos: UIButton!
    @IBOutlet weak var botonContinua: UIButton!
    @IBOutlet weak var botonDetener: UIButton!
    @IBOutlet weak var labelAcelerometro: UILabel!
    @IBOutlet weak var labelGiroscopio: UILabel!
    @IBOutlet weak var labelActitud: UILabel!
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    var timerDeActualizacion : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.botonEventos.isEnabled = true
        self.botonContinua.isEnabled = true
        self.botonDetener.isEnabled = false
    }
    
    
    @IBAction func actualizaPorEvento(_ sender: UIButton) {
        if self.motionManager.isDeviceMotionAvailable {
            self.botonEventos.isEnabled = false
            self.botonContinua.isEnabled = false
            self.botonDetener.isEnabled = true
            
            self.motionManager.deviceMotionUpdateInterval = 0.1
            self.motionManager.startDeviceMotionUpdates(to: self.queue) { (device, error) in
                self.actualizaDisplay()
//                let acelerometro = device?.userAcceleration
//                let gravedad = device?.gravity
//                let rotacion = device?.rotationRate
//                let actitud = device?.attitude
//
//                let textoAceleracion = String(format: "Aceleración\n-----------\n" + "Gravedad en x: %+.2f\t\tUsuario en x: %+.2f\n" +  "Gravedad en y: %+.2f\t\tUsuario en y: %+.2f\n" +  "Gravedad en z: %+.2f\t\tUsuario en z: %+.2f\n", gravedad!.x, acelerometro!.x, gravedad!.y, acelerometro!.y, gravedad!.z, acelerometro!.z)
//
//                let textoGiroscopio = String(format: "Rotacion\n--------\n" + "x: %+.2f\n" +  "y: %+.2f\n" +  "z: %+.2f\n", rotacion!.x, rotacion!.y, rotacion!.z)
//
//                let textoActitud = String(format: "Actitud\n-------\n" + "Giro: %+.2f\n" +  "Inclinacion: %+.2f\n" +  "Cabezeo: %+.2f\n", actitud!.roll, actitud!.pitch, actitud!.yaw)
//
//                DispatchQueue.main.async(execute: {
//                    self.labelAcelerometro.text = textoAceleracion
//                    self.labelGiroscopio.text = textoGiroscopio
//                    self.labelActitud.text = textoActitud
//                }) // closure
            } //startDeviceMotionUpdates
        }// if
    }//func actualizaPorEvento
    
    @IBAction func actualizaContnua(_ sender: UIButton) {
        if self.motionManager.isDeviceMotionAvailable {
            self.botonEventos.isEnabled = false
            self.botonContinua.isEnabled = false
            self.botonDetener.isEnabled = true
            
            self.motionManager.deviceMotionUpdateInterval = 0.1
            self.motionManager.startDeviceMotionUpdates()
            self.timerDeActualizacion = Timer(timeInterval: 0.1, target: self, selector: #selector(actualizaDisplay), userInfo: nil, repeats: true)
        }//if
    }
    
    @objc func actualizaDisplay() {
        
        let device = self.motionManager.deviceMotion
        if device != nil {
            let acelerometro = device?.userAcceleration
            let gravedad = device?.gravity
            let rotacion = device?.rotationRate
            let actitud = device?.attitude
            
            let textoAceleracion = String(format: "Aceleración\n-----------\n" + "Gravedad en x: %+.2f\t\tUsuario en x: %+.2f\n" +  "Gravedad en y: %+.2f\t\tUsuario en y: %+.2f\n" +  "Gravedad en z: %+.2f\t\tUsuario en z: %+.2f\n", gravedad!.x, acelerometro!.x, gravedad!.y, acelerometro!.y, gravedad!.z, acelerometro!.z)
            
            let textoGiroscopio = String(format: "Rotacion\n--------\n" + "x: %+.2f\n" +  "y: %+.2f\n" +  "z: %+.2f\n", rotacion!.x, rotacion!.y, rotacion!.z)
            
            let textoActitud = String(format: "Actitud\n-------\n" + "Giro: %+.2f\n" +  "Inclinacion: %+.2f\n" +  "Cabezeo: %+.2f\n", actitud!.roll, actitud!.pitch, actitud!.yaw)
            
            DispatchQueue.main.async(execute: {
                self.labelAcelerometro.text = textoAceleracion
                self.labelGiroscopio.text = textoGiroscopio
                self.labelActitud.text = textoActitud
            }) // closure
        }
        
    }
    
    @IBAction func detener(_ sender: UIButton) {
        self.motionManager.stopDeviceMotionUpdates()
        if self.timerDeActualizacion != nil {
            self.timerDeActualizacion.invalidate()
            self.timerDeActualizacion = nil
        }
        self.botonEventos.isEnabled = true
        self.botonContinua.isEnabled = true
        self.botonDetener.isEnabled = false
    }
    

}

