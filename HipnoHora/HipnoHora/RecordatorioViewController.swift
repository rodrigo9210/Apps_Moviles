//
//  RecordatorioViewController.swift
//  HipnoHora
//
//  Created by Arce Anguiano Rodrigo Roberto on 9/23/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit
import UserNotifications

class RecordatorioViewController: UIViewController {

    
    @IBOutlet weak var DatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound, .alert], completionHandler: {(autorizado, error) in print("El Usuario Autorizo?: \(autorizado)")})
        self.DatePicker.minimumDate = Date()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AgendarCita(_ sender: UIButton) {
        let notificacion = UNMutableNotificationContent()
        notificacion.title = "Hipnotizamiento"
        notificacion.body = "LLego la hora de tu sesion"
        notificacion.badge = 1
        //notificacion.sound = UNNotificationSound.default
        notificacion.sound = UNNotificationSound(named: UNNotificationSoundName("sonido.wav"))
        let disparo = UNCalendarNotificationTrigger.init(dateMatching: Calendar.current.dateComponents([.day, .month, .hour, .minute], from: self.DatePicker.date), repeats: true)
        let request = UNNotificationRequest(identifier: "Hipnosis", content: notificacion, trigger: disparo)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        print(self.DatePicker.date)
        print(request.trigger!)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
