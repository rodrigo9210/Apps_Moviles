//
//  ViewController.swift
//  Hipnosis
//
//  Created by Arce Anguiano Rodrigo Roberto on 9/4/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var HipnosisScroll: UIScrollView!
    
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
        let hipnosisUno = HipnosisView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        let hipnosisDos = HipnosisView(frame: CGRect(x: self.view.bounds.size.width, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height))
        self.HipnosisScroll.addSubview(hipnosisUno)
        self.HipnosisScroll.addSubview(hipnosisDos)
        self.HipnosisScroll.contentSize = pantallaGrande.size
    }

    
    
}

