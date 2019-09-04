//
//  ModeloDelQuiz.swift
//  Clase2-Quiz
//
//  Created by Arce Anguiano Rodrigo Roberto on 8/19/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import Foundation

class ModeloDelQuiz{
    //MARK: -Declaracion de variables
    
    //var variable
    var contador = 0
    //let constante LOS ARREGLOS SON PARTE DEL MODELO -> NO DEBEN ESTAR EN EL CONTROLADOR
    let preguntas : Array<String> = ["Como se apellida Juan","Capital MX","Cuanto es 2+2"]
    let respuestas = ["Topo","CDMX","4"]
    
    
    //MARK: -Implementacion del Modelo
    
    //FIXME: -Hacer que empieze desde 0
    func getPregunta() -> String{
        self.contador += 1
        if(self.contador == self.preguntas.count){
            self.contador = 0
        }
        
        return self.preguntas[self.contador]
    }
    
    func getRespuesta() -> String{
        return self.respuestas[self.contador]
    }
    
    //TODO: -Eliminar funcion
    func pregunta() -> String{
        return preguntas[0]
    }
}
