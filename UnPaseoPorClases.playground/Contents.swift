import UIKit

protocol Descriptible {
    func describete() -> String
}

class Persona : Descriptible{
    func describete() -> String {
        return "Me llamo \(self.nombre) \(self.apellido), nací en \(self.añoDeNacimiento), tengo \(self.edad) años y mi nacionalidad es \(self.nacionalidad)."
    }
    
    var nombre : String
    var apellido : String
    var nacionalidad = "Mexicana"
    let añoDeNacimiento : Int
    var disponible = true
    //variable computada
    var edad : Int {
        //si solo se hace el get no se tiene que escribir la palabra
        // component es un enum y .year es la forma de acceder a la variable del enum
        let añoActual = Calendar.current.component(.year, from: Date())
        return añoActual - self.añoDeNacimiento
    }
    
    //INICIALIZADORES (constructores)
    init (nombre : String, apellido : String, añoDeNacimiento : Int) {
        self.nombre = nombre
        self.apellido = apellido
        self.añoDeNacimiento = añoDeNacimiento
    }
    
    convenience init (nombre : String, apellido : String, añoDeNacimiento : Int, disponible : Bool) {
        self.init(nombre : nombre, apellido : apellido, añoDeNacimiento : añoDeNacimiento)
        self.disponible = disponible
    }
    
    func casar (con pareja: Persona, tomaApellido : Bool) {
        if (self.disponible && pareja.disponible) {
            if tomaApellido {
                self.apellido = pareja.apellido
            }
            self.disponible = false
            pareja.disponible = false
        }
        else {
            print ("No se puede casar a \(self.nombre) con \(pareja.nombre)")
        }
    }
}

var juanTopo = Persona(nombre: "Juan", apellido: "Topo", añoDeNacimiento: 1968)
juanTopo.describete()
juanTopo.nacionalidad = "Brasileña"
juanTopo.describete()
var ednaKrabapple = Persona(nombre: "Edna", apellido: "Krabapple", añoDeNacimiento: 1975)
juanTopo.casar(con: ednaKrabapple, tomaApellido: true)
var moeSislack = Persona(nombre: "Moe", apellido: "Sislack", añoDeNacimiento: 1976)
ednaKrabapple.casar(con: moeSislack, tomaApellido: false)
var apuN = Persona(nombre: "Apu", apellido: "N", añoDeNacimiento: 1980, disponible: false)
moeSislack.casar(con: apuN, tomaApellido: false)

class Alumno : Persona {
    override func describete() -> String {
        let descripcionPersona = super.describete()
        let descripcionAlumno = "Estudia \(self.carrera) en el semestre \(self.semestre) con promedio de \(self.promedio)"
        return descripcionPersona + descripcionAlumno
    }
    
    var carrera : String
    var semestre = 1
    var promedio : Double = 0.0
    
    init(nombre: String, apellido: String, añoDeNacimiento: Int, estudia carrera : String) {
        self.carrera = carrera
        super.init(nombre: nombre, apellido: apellido, añoDeNacimiento: añoDeNacimiento)
    }
}

let martinPrince = Alumno(nombre: "Martin", apellido: "Prince", añoDeNacimiento: 1999, estudia: "Casa Bolsero")

martinPrince.describete()
