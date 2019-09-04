
import UIKit

protocol Descriptible {
    func describete() -> String
}

//Enums Basicos
enum Simpsons : Descriptible{
    func describete() -> String {
        return "Soy un Simpson"
    }
    
    case Homero
    case Marge
    case Bart
    case Lisa
    case Maggie
}

var personaje = Simpsons.Homero
//ya sabe que es un enum entonces se puede acceder a los otros casos sin hacer referencia al Enum Simpsons
personaje = .Lisa

if personaje == .Homero {
    print("MMM la rosca prohibida")
}

personaje.describete()

//switch en swift funciona para cualquier tipo pero no puedes dejar opciones sin cubrir
switch personaje {
case .Homero:
    print("mmmm rosquillas")
case .Marge:
    print("grrr")
case .Bart:
    print("Ay caramba")
case .Lisa:
    print("Preparé gazpacho")
case .Maggie:
    print("chk chk")
}

//Raw value enums cada case tiene que tener un valor unico
enum Semana : Int {
    case Lunes = 1
    case Martes, Miercoles, Jueves, Viernes
    case Sabado = 10
    case Domingo = 200
}

var dia = Semana.Lunes //simultaeamente vale Lunes y 1
dia.rawValue

let diaDeDescanso = Semana(rawValue: 200)


enum Aerolineas : String, Descriptible {
    case AM = "Aeromexico"
    case MX = "Mexicana"
    case VB = "Viva Aerobus"
    case Y4 = "Volaris"
    static let todasLasAerolineas = [AM, MX, VB, Y4]
    func puntual() -> Bool {
        if self == .AM || self == .VB {
            return true
        }
        return false
    }
    
    func describete() -> String {
        if self == .MX {
            return "RIP"
        }
        return self.rawValue
    }
}

var miLineaAerea = Aerolineas.AM
miLineaAerea.describete()
miLineaAerea.puntual()

miLineaAerea = .MX
miLineaAerea.describete()

//Variable de Tipo
Aerolineas.todasLasAerolineas[2].describete()
Aerolineas.Y4.rawValue

//Associated value enums
enum Transportes {
    case Metro(Int)
    case Coche(String, Int, String)
    case Avion(Aerolineas, Int)
}

var miViaje = Transportes.Metro(7)
miViaje = .Coche("Gol", 123, "ABC")
miViaje = .Avion(.VB, 125)

func transporteComodo (medioTransporte : Transportes) -> (Bool, String) {
    switch medioTransporte {
    case .Avion(let compañia, _):
        if compañia == .MX{
            return (false, "Ya no existe")
        }
        return (compañia == .AM, "La mejor manera de volar")
    case .Coche(let modelo, _, _) where modelo != "Vocho":
        return (true, "Pero tienes que manejar")
    default:
        return (false, "Tiene cobertura muy limitada")
    }
}

transporteComodo(medioTransporte: miViaje)
