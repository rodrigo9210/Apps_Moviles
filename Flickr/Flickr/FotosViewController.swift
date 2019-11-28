//
//  FotosViewController.swift
//  Flickr
//
//  Created by Arce Anguiano Rodrigo Roberto on 11/25/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit

class FotosViewController: UIViewController {

    @IBOutlet weak var fotosView: UIImageView!
    let listaDeFotos = ListaDeFotos()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listaDeFotos.traerFotosRecientes { (respuesta) in
            switch respuesta {
            case let .exito(fotos):
                print("Se recuperaron \(fotos.count) fotos recientes")
                self.actualizaLaImagen(paraFoto: fotos.randomElement()!)
            case let .fracaso(error):
                print("Ocurrrio el error: \(error)")
            }
        }
        // Do any additional setup after loading the view.
    }
    
    func actualizaLaImagen(paraFoto foto: Foto) {
        self.listaDeFotos.traeLaImagen(paraLaFoto: foto) { (respuesta) in
            switch respuesta {
            case let .exito(imagen):
                OperationQueue.main.addOperation {
                    self.fotosView.image = imagen
                }
            case let .fracaso(error):
                print("Ocurrio el error: \(error)")
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
