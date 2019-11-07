//
//  ViewController.swift
//  HealthKit
//
//  Created by Arce Anguiano Rodrigo Roberto on 11/4/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{
    
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var labelDist: UILabel!
    @IBOutlet weak var botonStart: UIButton!
    @IBOutlet weak var labelPeso: UILabel!
    @IBOutlet weak var labelPorcentaje: UILabel!
    var timer = Timer()
    var zeroTime = TimeInterval()
    var distancia = 0.0
    var lastLocation : CLLocation?
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func botonStart(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: Selector(("updateTime")), userInfo: nil, repeats: true)
        zeroTime = NSDate.timeIntervalSinceReferenceDate
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        } else{
            print("perdon nathan")
        }
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let newLocation = locations.last!
        if lastLocation == nil{
            distancia = 0.0
        } else {
            distancia += newLocation.distance(from: lastLocation!)
        }
        
        self.lastLocation = newLocation
        self.labelDist.text = String(format: "%02 g", distancia)
    }
    
    @IBAction func botonStop(_ sender: UIButton) {
        timer.invalidate()
        locationManager.stopUpdatingHeading()
        distancia = 0.0
        lastLocation = nil
    }
    
    @objc func updateTime(){
        let currentTime = NSDate.timeIntervalSinceReferenceDate
        var timePassed  = currentTime - self.zeroTime
        let minutos = UInt16(timePassed) / 60
        timePassed -= (TimeInterval(minutos) * 60)
        let seconds = UInt16(timePassed)
        
        let strMinutos = String(format: "%02d", minutos)
        let strSegundos = String(format: "%02d", seconds)
        labelTime.text = "\(strMinutos):\(strSegundos)"
    }
}

