//
//  ViewController.swift
//  Mis Vistas
//
//  Created by Arce Anguiano Rodrigo Roberto on 9/2/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let miRect = CGRect(x: 30, y: 30, width: 50, height: 50)
        let vista1 = UIView(frame: miRect)
        vista1.backgroundColor = .black
        self.view.subviews[0].subviews[0].addSubview(vista1)
    }


}

