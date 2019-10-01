//
//  GenericoViewController.swift
//  miNavigationController
//
//  Created by Arce Anguiano Rodrigo Roberto on 9/30/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit

class GenericoViewController: UIViewController {

    @IBOutlet weak var labelCuenta: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func botonSiguiente() {
        (parent as! CuentaNavigationViewController).cuentaDePushes += 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        labelCuenta.text = String((parent as! CuentaNavigationViewController).cuentaDePushes)
    }
    
    //UIStoryboardSegue es un transiscion
    @IBAction func regresoAPrimero(_ sender: UIStoryboardSegue) {
        //para ir al primer view controller
        self.navigationController?.popToRootViewController(animated: true)
        //tambien hay que conectar el boton con el icono que dice exit encima de la pantalla en ek story board
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
