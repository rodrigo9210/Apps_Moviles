import UIKit

//PROCOLO: metodos y propiedades declaradadas pero no implementadas
protocol Descriptible {
    func describete() -> String
}

//struct no puede heredar
struct PuntoEnElMapa: Descriptible {
    //Propiedades
    var longitud: Double
    var latitud: Double
    
    //Funciones implementadas
    func describete() -> String {
        return "Latitud: \(self.latitud), Longitud: \(self.longitud)"
    }
    
    func distanciaEntreElPunto (coordenada punto: PuntoEnElMapa) -> Double {
        let distanciaLatitud = self.latitud - punto.latitud
        let distanciaLongitud = self.longitud - punto.longitud
        return sqrt(pow(distanciaLatitud,2) + pow(distanciaLongitud,2))
    }
}

var miPosicion = PuntoEnElMapa(longitud: 25, latitud: 12)
miPosicion.describete()
var miDestino = PuntoEnElMapa(longitud: 60, latitud: 8)
miPosicion.distanciaEntreElPunto(coordenada: miDestino)

//Propiedades computadas y almacenadas
struct Punto : Descriptible {
    var x = 0.0
    var y = 0.0
    
    func describete() -> String {
        return "\(x) , \(y)"
    }
}

struct Tamaño : Descriptible {
    var ancho = 0.0, alto = 0.0
    
    func describete() -> String {
        return "\(ancho) , \(alto)"
    }
}

struct Rectangulo : Descriptible{
    //variables de tipo (estaticas), una vez que se ejecutan siguen estando ahi
    static var tipo = "Rectangulo"
    
    //propiedad almacenada
    var origen = Punto() {
        //property observers
        willSet{
            print ("Vas a mover el origen a la coordenada \(newValue.describete())")
        }
        didSet {
            //uso de oldValue
            print ("El punto se movio desde \(oldValue.describete())")
        }
    }
    var tamaño = Tamaño()
    //propiedad computada
    var centro : Punto {
        get {
            let centroX = origen.x + (tamaño.ancho / 2)
            let centroY = origen.y + (tamaño.alto / 2)
            return Punto(x: centroX, y: centroY)
        }
        set {
            //uso de newValue
            origen.x = newValue.x - (tamaño.ancho / 2)
            origen.y = newValue.y - (tamaño.alto / 2)
        }
    }
    var area : Double {
        get {
            return tamaño.alto * tamaño.ancho
        }
    }
    
    //cambiar variables del objeto desde el objeto mismo
    mutating func desplazate(alPunto punto:Punto) {
        self.origen = punto
    }
    
    func describete() -> String {
        return "Origen: \(self.origen.describete()) Tamaño: \(self.tamaño.describete()) Centro: \(self.centro.describete()) Area: \(self.area)"
    }
}

var miRectangulo = Rectangulo(origen: Punto(x: 50, y: 20), tamaño: Tamaño(ancho: 100, alto: 75))

miRectangulo.describete()
miRectangulo.tamaño.ancho = 30
miRectangulo.centro.describete()
miRectangulo.centro = Punto(x: 200, y: 108)
miRectangulo.describete()
miRectangulo.area
miRectangulo.desplazate(alPunto: Punto(x: 0, y: 0))
miRectangulo.describete()

struct Persona: Descriptible {
    var nombre: String
    var nacionalidad: String
    
    func describete() -> String {
        return "Mi nombre es \(self.nombre) y soy \(self.nacionalidad)"
    }
}

let juanTopo = Persona(nombre: "Juan Topo", nacionalidad: "Springfileano")
juanTopo.describete()

//si varias structs implementan (heredan) un protocolo pueden ser almacendas en un solo arreglo
let arregloHeterogeneo: Array<Descriptible> = [miPosicion, juanTopo]
