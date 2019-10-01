//
//  HipnosisView.swift
//  Hipnosis
//
//  Created by Arce Anguiano Rodrigo Roberto on 9/4/19.
//  Copyright © 2019 Arce Anguiano Rodrigo Roberto. All rights reserved.
//

import UIKit

//subclase de UIView
class HipnosisView: UIView {
    
    private var colorDelCirculo : UIColor = .blue {
        //ESTABLECER UN PROPERTY OBSERVER
        didSet {
            setNeedsDisplay()
        }
    }
    
    override var canBecomeFirstResponder: Bool{
        return true
    }
    
    func inicializaVista(){
        self.backgroundColor = .clear
    }
    
    //LAS VISTAS REQUIEREN DOS INICIALIZADORES (init por codigo e init por storyboard)
    //inicializador desde codigo
    override init(frame: CGRect) {
        super.init(frame: frame)
        inicializaVista()
    }
    
    //inicializador desde storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        inicializaVista()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //creacion de numeros aleatorios entre 0 y 1 de 3 formas diferentes
        let rojo = CGFloat(arc4random() % 100) / 100
        let verde = CGFloat(arc4random_uniform(100)) / 100
        let azul = CGFloat.random(in: 0...100) / 100
        let colorRandom = UIColor(displayP3Red: rojo, green: verde, blue: azul, alpha: 1)
        print(colorRandom)
        self.colorDelCirculo = colorRandom
    }
    
    
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            print("Esta Temblando")
            colorDelCirculo = .red
        }
        //decirle que somos first responder en el viewcontroller
    }
    
    // LA FUNCION DRAW NUNCA SE LLAMA
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
         //dibuja un tache
        //path.move(to: self.bounds.origin) //se mueve al origen
        //path.addLine(to: CGPoint(x: self.bounds.maxX, y: self.bounds.maxY)) //dibuja una linea hasta la esquina contraria
        //path.move(to: CGPoint(x: self.bounds.maxX, y: 0))
        //path.addLine(to: CGPoint(x: 0, y: self.bounds.maxY))
        
        //dibuja un circulo
        var centro : CGPoint = .zero
        centro.x = self.bounds.midX
        centro.y = self.bounds.midY
//        let radio = min(self.bounds.size.width, self.bounds.size.height) / 2.0 //regresa el minimo entre el anch y alto de la vista
//        path.move(to: CGPoint(x: centro.x + radio, y: centro.y))
//        path.addArc(withCenter: centro, radius: radio, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        let radioMaximo = hypot(self.bounds.width / 2 , self.bounds.height / 2)
        
        for radioActual in stride(from: radioMaximo, to: 0, by: -15) {
            path.move(to: CGPoint(x: centro.x + radioActual, y: centro.y))
            path.addArc(withCenter: centro, radius: radioActual, startAngle: 0, endAngle: CGFloat(Double.pi * 2.0), clockwise: true)
        }
        
        path.lineWidth = 5
        self.colorDelCirculo.setStroke()
        //el color de la linea pertenece a UIColor
        //UIColor.lightGray.setStroke()
        path.stroke()
        
    }
}
