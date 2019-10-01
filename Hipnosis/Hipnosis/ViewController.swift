//
//  ViewController.swift
//  Hipnosis
//
//  Created by Arce Anguiano Rodrigo Roberto on 9/4/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var HipnosisScroll: UIScrollView!
    var hipnosisUno : HipnosisView!
    var campoDeTexto : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //AGREGA UNA VISTA HIPNOSISVIEW de forma PROGRAMATICA
//        let miTache = HipnosisView()
//        let miFrame = CGRect(origin: CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY), size: CGSize(width: 50, height: 200))
//        miTache.frame = miFrame
//        miTache.backgroundColor = .clear
//        self.view.addSubview(miTache)
        
        ////////AGREGA UNA PANTALLA SCROLL
        
//        let pantallaGrande = CGRect(x: 0, y: 0, width: self.view.bounds.size.width * 2 , height: self.view.bounds.size.height * 2)
//        let hipnosisGigante = HipnosisView(frame: pantallaGrande)
//
//        //ponla en la pantalla
//        self.HipnosisScroll.addSubview(hipnosisGigante)
//        self.HipnosisScroll.contentSize = pantallaGrande.size
//        self.HipnosisScroll.bounces = false
        
        ///AGREGA DOS PANTALLAS SCROLL
        
        let pantallaGrande = CGRect(x: 0, y: 0, width: self.view.bounds.size.width * 2 , height: self.view.bounds.size.height)
        self.hipnosisUno = HipnosisView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        let hipnosisDos = HipnosisView(frame: CGRect(x: self.view.bounds.size.width, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        self.HipnosisScroll.addSubview(hipnosisUno)
        self.HipnosisScroll.addSubview(hipnosisDos)
        self.HipnosisScroll.contentSize = pantallaGrande.size
        
        hipnosisUno.becomeFirstResponder()
        
        //Campo de texto
        let origenDelCampoDeTexto = CGPoint(x: self.view.bounds.size.width / 8, y: -30) //self.view.bounds.size.height / 12
        let tamañoDelCampoDeTexto = CGSize(width: self.view.bounds.size.width * 0.75, height: 30)
        self.campoDeTexto = UITextField(frame: CGRect(origin: origenDelCampoDeTexto, size: tamañoDelCampoDeTexto) )
        
        self.campoDeTexto.backgroundColor = .white
        self.campoDeTexto.borderStyle = .roundedRect
        self.campoDeTexto.placeholder = "HIPNOTIZATE...."
        self.campoDeTexto.textAlignment = .center
        self.campoDeTexto.returnKeyType = .done
        self.campoDeTexto.delegate = self
        
        UIView.animate(withDuration: <#T##TimeInterval#>,
                       delay: <#T##TimeInterval#>,
                       usingSpringWithDamping: <#T##CGFloat#>,
                       initialSpringVelocity: <#T##CGFloat#>,
                       options: <#T##UIView.AnimationOptions#>,
                       animations: <#T##() -> Void#>,
                       completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        
        self.hipnosisUno.addSubview(campoDeTexto)
        
    }//viewDidLoad
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        poneMuchosTextosEnLaPantalla(texto: textField.text!)
        textField.text = ""
        textField.resignFirstResponder() //PARA QUITAR EL TECLADO
        return true
    }
    
    func poneMuchosTextosEnLaPantalla(texto : String) {
        for _ in 0...20 {
            let labelParaTexto = UILabel()
            labelParaTexto.text = texto
            labelParaTexto.textColor = .black
            labelParaTexto.backgroundColor = .clear
            labelParaTexto.sizeToFit()
            let coordenadaXMaxima = self.view.bounds.maxX - labelParaTexto.bounds.maxX
            let coordenadaYMaxima = self.view.bounds.maxY - labelParaTexto.bounds.maxY
            let origenX = CGFloat.random(in: 0...coordenadaXMaxima)
            let origenY = CGFloat.random(in: 0...coordenadaYMaxima)
            labelParaTexto.frame.origin = CGPoint(x: origenX, y: origenY)
            self.hipnosisUno.addSubview(labelParaTexto)
        }
    }

    
    
}

