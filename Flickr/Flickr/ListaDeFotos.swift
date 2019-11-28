//
//  ListaDeFotos.swift
//  Flickr
//
//  Created by Arce Anguiano Rodrigo Roberto on 11/25/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import Foundation
import UIKit

enum RespuestaDeImagen {
    case exito(UIImage)
    case fracaso(Error)
}

enum ErrorDeFoto: Error {
    case errorAlCrearLaImagen
}

class ListaDeFotos {
    
    let sesion : URLSession = {
        URLSession(configuration: URLSessionConfiguration.default)
    }()
    
    func traerFotosRecientes(completion: @escaping(RespuestaDeFotos) -> Void) { //@escaping espera a que reciba toda la informacion para poder ejecutar el mismo closure
        let url = FlickrAPI.URLFotosRecientes()
        let request = URLRequest(url: url)
        let task = sesion.dataTask(with: request) {
            (datos, respuesta, error) in
            if let datosJSON = datos {
//                if let stringJSON = String(data: datosJSON, encoding: .utf8) {
//                    print(stringJSON)
//                }
//                do {
//                    let objetoJSON = try JSONSerialization.jsonObject(with: datosJSON, options: [])
//                    print(objetoJSON)
//                } catch let error {
//                    print("Error al crear objeto JSON: \(error) ")
//                }
                let JSONProcesado = self.procesaLaSolicitudDeFotos(datos: datosJSON, error: error)
                completion(JSONProcesado)
                //completion(self.procesaLaSolicitudDeFotos(datos: datosJSON, error: error))
                
            } else if let errorEnPeticion = error {
                print("Error al recuperar las fotos recientes: \(errorEnPeticion)")
            } else {
                print ("Error inesperado")
            }
        }
        task.resume() //ejecuta la peticion
        
    }//func
    
    private func procesaLaSolicitudDeFotos(datos: Data?, error: Error?) -> RespuestaDeFotos {
        guard let datosJSON = datos else {
            return .fracaso(error!)
        }
        
        return FlickrAPI.fotos(desdeJSON: datosJSON)
    }
    
    private func procesaLaSolicitudDeImagen(datos: Data?, error: Error?) -> RespuestaDeImagen {
        guard let datosParaImagen = datos,
            let imagen = UIImage(data: datosParaImagen) else {
                if datos == nil {
                    return .fracaso(error!)
                } else {
                    return .fracaso(ErrorDeFoto.errorAlCrearLaImagen)
                }
        }
        
        return .exito(imagen)
    }
    
    func traeLaImagen(paraLaFoto foto: Foto, completion: @escaping(RespuestaDeImagen) -> Void) {
        let url = foto.urlRemoto
        let request = URLRequest(url: url)
        let task = sesion.dataTask(with: request) { (datos, respuest, error) in
            let imagenProcesada = self.procesaLaSolicitudDeImagen(datos: datos, error: error)
            completion(imagenProcesada)
        }
        task.resume()
    }
}//class
