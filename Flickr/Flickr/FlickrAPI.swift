//
//  FlickrAPI.swift
//  Flickr
//
//  Created by Arce Anguiano Rodrigo Roberto on 11/25/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import Foundation

enum Metodos : String{
    case FotosRecientes = "flickr.photos.getRecent"
}

enum RespuestaDeFotos {
    case exito([Foto])
    case fracaso(Error)
}

enum ErrorDeFlickr: Error {
    case JSONInvalido
}

struct FlickrAPI {
    private static let urlBase = "https://api.flickr.com/services/rest/"
    private static let APIkey = "44015f12fe84d4c31c7bc090182c787f"
    private static let dateFormatter : DateFormatter = {
        let formato = DateFormatter()
        formato.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formato
    }()
    
    private static func URLFLickr(metodo: Metodos, parametros: [String:String]?) -> URL {
        var componentes = URLComponents(string: urlBase)!
        var itemsDeQuery = [URLQueryItem]()
        let parametrosBase = [
            "method": metodo.rawValue,
            "format" : "json",
            "nojsoncallback" : "1",
            "api_key": APIkey
        ]
        
        for (llave,valor) in parametrosBase {
            let item = URLQueryItem(name: llave, value: valor)
            itemsDeQuery.append(item)
        }
        
        if let parametrosAdicionales = parametros {
            for (llave,valor) in parametrosAdicionales {
                let item = URLQueryItem(name: llave, value: valor)
                itemsDeQuery.append(item)
            }
        }
        
        componentes.queryItems = itemsDeQuery
        
        return componentes.url!
    }
    
    static func URLFotosRecientes() -> URL {
        return URLFLickr(metodo: .FotosRecientes, parametros: ["extras" : "url_h,date_taken"])
    }
    
    static func fotos(desdeJSON datos: Data) -> RespuestaDeFotos {
        do {
            let objetoJSON = try JSONSerialization.jsonObject(with: datos, options: [])
            guard let diccionarioJSON = objetoJSON as? [String: Any],
                let diccionarioPhotos = diccionarioJSON["photos"] as? [String: Any],
                let arregloDePhotos = diccionarioPhotos["photo"] as? [[String: Any]] else {
                    return .fracaso(ErrorDeFlickr.JSONInvalido)
            }
            
            var fotosRecuperadas = [Foto]()
            
            for fotoEnJSON in arregloDePhotos {
                if let foto = foto(desdeJSON: fotoEnJSON){
                    fotosRecuperadas.append(foto)
                }
            }
            
            if fotosRecuperadas.isEmpty && !arregloDePhotos.isEmpty{
                return .fracaso(ErrorDeFlickr.JSONInvalido)
            }
            
            return .exito(fotosRecuperadas)
            
        } catch let error {
            return .fracaso(error)
        }
    }
    
    private static func foto(desdeJSON json: [String:Any]) -> Foto? {
        guard let titulo = json["title"] as? String,
            let fechaString = json["datetaken"] as? String,
            let urlString = json["url_h"] as? String,
            let url = URL(string: urlString),
            let id = json["id"] as? String,
            let fechaTomada = dateFormatter.date(from: fechaString) else {
                return nil
        }
        
        return Foto(titulo: titulo, urlRemoto: url, idDeFoto: id, fechaTomada: fechaTomada)
    }
}
