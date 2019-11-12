//
//  ViewController.swift
//  LaRoscaProhibida
//
//  Created by Arce Anguiano Rodrigo Roberto on 11/11/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let intervaloDeActualizacion = 0.01
    let motionManager = CMMotionManager()
    let colaDeOperaciones = OperationQueue()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.motionManager.deviceMotionUpdateInterval = intervaloDeActualizacion
        self.motionManager.startDeviceMotionUpdates(to: colaDeOperaciones, withHandler: { (datosDeSensores: CMDeviceMotion!, error: Error!) in
            
            let vistaDeDona = self.view as! Dona
            vistaDeDona.aceleracion = datosDeSensores.gravity
            DispatchQueue.main.async {
                vistaDeDona.actualizaPosicion()
            }
        })
    }


}

