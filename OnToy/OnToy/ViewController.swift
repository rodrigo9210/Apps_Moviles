//
//  ViewController.swift
//  OnToy
//
//  Created by Arce Anguiano Rodrigo Roberto on 10/30/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var labelLatitud: UILabel!
    @IBOutlet weak var labelLongitud: UILabel!
    @IBOutlet weak var labelPresicionHor: UILabel!
    @IBOutlet weak var labelAltitud: UILabel!
    @IBOutlet weak var labelPresicionVer: UILabel!
    @IBOutlet weak var labelDistancia: UILabel!
    @IBOutlet weak var mapa: MKMapView!
    
    
    var manager = CLLocationManager()
    var ubicacionPrevia: CLLocation? = nil
    var desplazamientoTotal: CLLocationDistance = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        self.mapa.delegate = self
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("Autorizacion: \(status.rawValue)")
        
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
            self.mapa.showsUserLocation = true
        default:
            manager.stopUpdatingLocation()
            self.mapa.showsUserLocation = false
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        let elError = "Error: \((error as NSError).code) - \(error.localizedDescription)"
        let alerta = UIAlertController(title: "Hijole", message: elError, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Pus ya que", style: .cancel, handler: nil)
        
        alerta.addAction(ok)
        present(alerta, animated: true, completion: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations.last!)
        let nuevaUbicacion = locations.last!
        self.labelLatitud.text = String(format: "%g\u{00B0}", nuevaUbicacion.coordinate.latitude)
        self.labelLongitud.text = String(format: "%g\u{00B0}", nuevaUbicacion.coordinate.longitude)
        self.labelPresicionHor.text = String(format: "%gm", nuevaUbicacion.horizontalAccuracy)
        self.labelAltitud.text = String(format: "%gm", nuevaUbicacion.altitude)
        self.labelPresicionVer.text = String(format: "%gm", nuevaUbicacion.verticalAccuracy)
        
        if ubicacionPrevia == nil {
            self.desplazamientoTotal = 0
            
            let inicio = Lugar(coordenada: nuevaUbicacion.coordinate, titulo: "Inicio", subtitulo: "Primer Paso")
            self.mapa.addAnnotation(inicio)
            
            let region = MKCoordinateRegion(center: inicio.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
            self.mapa.setRegion(region, animated: true)
        
        } else if (nuevaUbicacion.coordinate.latitude != ubicacionPrevia!.coordinate.latitude) && (nuevaUbicacion.coordinate.longitude != ubicacionPrevia!.coordinate.longitude){
            self.desplazamientoTotal += nuevaUbicacion.distance(from: ubicacionPrevia!) / 1000
            
            self.mapa.setCenter(nuevaUbicacion.coordinate, animated: true)
            let siguienteDestino = Lugar(coordenada: nuevaUbicacion.coordinate, titulo: "Siguiente Puerto", subtitulo: nil)
            self.mapa.addAnnotation(siguienteDestino)
            
        }
        
        self.ubicacionPrevia = nuevaUbicacion
        self.labelDistancia.text = String(format: "%gkm", desplazamientoTotal)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is Lugar {
            let imagenParaAnotacion = MKAnnotationView(annotation: annotation, reuseIdentifier: "imagen para lugar")
            let imagen = UIImage(named: "homeroanotacion.png")
            imagenParaAnotacion.image = imagen
            imagenParaAnotacion.canShowCallout = true
            return imagenParaAnotacion
        } else {
            return nil
        }
    }

    @IBAction func tipoDeMapa(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            self.mapa.mapType = .standard
        case 1:
            self.mapa.mapType = .satellite
        case 2:
            self.mapa.mapType = .hybrid
        default:
            print("esto no pasa")
        }
        
    }
    
}

