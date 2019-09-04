import UIKit

var str = "Hello, playground"

let cadena : String = "Hola Mundo"

let cadena2 : String = "Adios Mundo"

var edad : Int
edad = 34
edad = 21

print("Hola tengo " + String(edad) + "años")

//String interpolation
print("Hola tengo \(edad) años")

//USO DE ÑÑÑÑÑ
let año = 2019

//y de emojis
var 🐳 = "🐳"

//estructuras casi iguales a clases, solo que las estructuras no tienen herencia
let pi = Double.pi

let pi2 : Double
pi2 = .pi

//funciones de las estructutas
pi2.isEqual(to: 3.1416)


//extensionde estructuras
extension Double {
    func saluda() {
        print("Hola soy el num \(self)")
    }
}

pi2.saluda()

//Colecciones
var 🦊 = "zorro"
var arreglo : Array<String> = ["🐆","🐗",🦊]

var zorro = "🦊"
var arregloSemiExplicito : [String] = ["🐆","🐗",zorro]

var arregloImplicito = [🦊, zorro, 🦊]

var arregloVacio = [String]()

print(arreglo[0])

//detecta el tipo de los arreglos
arregloImplicito.append(🦊)
arregloImplicito += ["🐒","🐒"]

//acceso a propiedades del arreglo
arregloImplicito.count
arregloSemiExplicito.description

//ciclos
var miGranja = ""

//ciclo con intervalo cerrado para evitar OutOfBounds
for i in 0..<arregloImplicito.count {
    miGranja += arregloImplicito[i]
    miGranja += ", "
}

print("Mi granja tiene \(miGranja)")

for animal in arregloImplicito {
    print("Ahora le toca al \(animal)")
}

for (indice,animal) in arregloImplicito.enumerated() {
    print ("El animal \(indice + 1) es \(animal)")
}

var m = 1
var n = 7
var resultado = 0

//ciclo con intervalo abierto y utilizando _ como variable temporal de un solo uso
for _ in 0...n{
    //suma desde 0 hasta 7 por el intervalo abierto
    resultado += m
}

print(resultado)

//DICCIONARIOS
let diccionario : Dictionary<String, String> = ["gallina":"hen", "pollito":"chicken", "lapíz":"pencil"]
let diccionario2 = ["gallina":"hen",
                    "pollito":"chicken",
                    "lapíz":"pencil"]

//Regreso de Optional ?
print(diccionario["gallina"])

//Desempaquetar el Optional con !
var traduccion = diccionario["gallina"]!
print(traduccion)

//Regreso de nil, no truena
print(diccionario2["perro"])

//Regreso de nil, entonces truena al desempaquetar
//print(diccionario2["perro"]!)

if let opcional = diccionario["perro"] {
    print(opcional)
} else {
    print("Ese animal no lo tengo")
}

//las variables OPtional pueden ser nil o el valor definido
var opcional2 : Int?
//Si el opcional es NIL podemos averiguarlo sin que truene
print(opcional2 ?? "No hay nada adentro")
//Cuando ya tiene contenido se puede desempaquetar correctamente
opcional2 = 32432
print(opcional2!)
