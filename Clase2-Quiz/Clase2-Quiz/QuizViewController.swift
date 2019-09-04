//
//  ViewController.swift
//  Clase2-Quiz
//
//  Created by Arce Anguiano Rodrigo Roberto on 8/15/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var labelDePregunta: UILabel!
    @IBOutlet weak var labelDeRespuesta: UILabel!
    
    //algo que esta en el mismo modulo no necesita imports
    let quiz = ModeloDelQuiz()
    
    //SE MANDA A LLAMAR CUANDO LA VISTA FUE CARGADA EN MEMORIA
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.labelDePregunta.text = self.quiz.pregunta()

    }

    @IBAction func botonDePreguntaPresionado() {
        self.labelDePregunta.text = quiz.getPregunta()
        self.labelDeRespuesta.text = "¿¿??"
    }
    
    @IBAction func botonDeRespuestaPresionado() {
       self.labelDeRespuesta.text = quiz.getRespuesta()
    }
    
}

