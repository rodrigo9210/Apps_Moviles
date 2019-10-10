//
//  EditorViewController.swift
//  MiSegue
//
//  Created by Arce Anguiano Rodrigo Roberto on 10/2/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit

class EditorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var botonOk: UIButton!
    @IBOutlet weak var campoDeEdicion: UITextField!
    var textoRecibido : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.campoDeEdicion.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.campoDeEdicion.text = (presentingViewController as! CorreoViewController).labelDeCorreo.text
        self.campoDeEdicion.text = self.textoRecibido
    }
    
    @IBAction func ok(_ sender: UIButton) {
        //alternativamente: self.campoDeEdicion.text! == ""
        if (self.campoDeEdicion.text?.isEmpty)! {
            self.botonOk.isEnabled = false
        } else {
            (presentingViewController as! CorreoViewController).labelDeCorreo.text = self.campoDeEdicion.text
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //no lleva override porque es delegado, no viene de una super clase
    //el resultado es descartable, no molesta con el regreso
    @discardableResult func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (campoDeEdicion.text?.isEmpty)! {
            self.botonOk.isEnabled = false
            return false
        }
        self.botonOk.isEnabled = true
        
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func tapRecibido(_ sender: UITapGestureRecognizer) {
        textFieldShouldReturn(self.campoDeEdicion)
    }
    
}
