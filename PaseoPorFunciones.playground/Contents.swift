import UIKit

func saluda() {
    print("Saluda")
}

//Para mostrar sus parametros y regreso
saluda
//Para llamar la funcion
saluda()

func cuentaVotos(votos: [String], votoAContar: String) -> Int {
    var cuenta = 0
    for voto in votos {
        if voto == votoAContar {
            cuenta += 1
        }
    }
    
    return cuenta
}

let votosRecibidos = ["si","si","si","si","si","no","no","xd"]
let votosAFavor = cuentaVotos(votos: votosRecibidos, votoAContar: "si")
print(votosAFavor)

func cuentaTodosLosVotos(votos: [String]) -> (votosAFavor: Int, votosEnContra: Int, abstenciones: Int){
    let votosSi = cuentaVotos(votos: votos, votoAContar: "si")
    let votosNo = cuentaVotos(votos: votos, votoAContar: "no")
    let votosNulos = votos.count - votosSi - votosNo
    return (votosSi, votosNo, votosNulos)
}

let resultadosTotales = cuentaTodosLosVotos(votos: votosRecibidos)

print("Votos a favor: \(resultadosTotales.votosAFavor)")
print("Votos en contra: \(resultadosTotales.1)")
print("Votos nulos: \(resultadosTotales.abstenciones)")

let (si,no,_) = cuentaTodosLosVotos(votos: votosRecibidos)
print("Si: \(si)")
print("No: \(no)")

//nombre de parametros externos e internos y externos sin nombre (_)
func repiteFrase(fraseARepetir frase: String, _ n: Int) -> String {
    var resultado = ""
    for _ in 1...n {
        resultado += frase
    }
    return resultado
}

//Uso de nombre externo de parametros
repiteFrase(fraseARepetir: "Ay Caramba! ", 4)

//funciones con regreso de opcional (regresa nil o regresa resultado)
func encuentraPares(arregloDeEnteros: [Int]) -> [Int]? {
    var numerosPares : [Int]?
    
    if arregloDeEnteros.isEmpty {
        numerosPares = nil
    } else {
        for numero in arregloDeEnteros {
            if numero % 2 == 0 {
                print(numero)
                //TODO: ver como agregar elementos a un arreglo opcional
                //numerosPares?.append(numero)
            }
        }
    }
    
    return numerosPares
}

if let paresEncontrados = encuentraPares(arregloDeEnteros: [1,2]) {
    print(paresEncontrados)
} else {
    print("Enviaste un arreglo vacio")
}

//forzar paso por referencia con inout
func pasoPorReferencia(string1: inout String, string2: inout String){
    let temp = string1
    string1 = string2
    string2 = temp
}

var saludo1 = "Hola "
var saludo2 = "Adios"

print(saludo1, saludo2)

//al momento de llamarlo pone automaticamente el &
pasoPorReferencia(string1: &saludo1, string2: &saludo2)
print(saludo1, saludo2)

func despidete() {
    print("Nos vemos")
}

//crear variable que apunta a una funcion, entonces se convierte en una funcion
var byebye = despidete

//llamar a la funcion con el nombre de la variable y ()
byebye()

//funcion que recibe otra funcion (en este caso una funcion que no recibe nada () y regresa Void
func funcionQueRecibeFuncion(argumento: () -> Void) {
    for i in 1...3 {
        print(String(i))
        argumento()
    }
}

//mandar byebye como argumento no requiere () porque es argumento
funcionQueRecibeFuncion(argumento: byebye)

//Encapsulamiento
func fecha() {
    print(Date())
}

//envio de funcion de encapsulamiento
funcionQueRecibeFuncion(argumento: fecha)

//no tengo que hacer una funcion para asignarlo a una variable
//puedo decir que la constante es una funcion
let convierteIntAFloat = {
    (enteroAConvertir: Int) -> Float in
    return Float(enteroAConvertir)
}

//imprimir la variable con argumentos
print(convierteIntAFloat(9))

//funcion que recibe un int, una funcion y regresa un arreglo de enteros opcional
func numerosQueCumplenConUnaCondicion (numerosAProbar: [Int], condicion: (Int) -> Bool) -> [Int]? {
    if numerosAProbar.isEmpty {
        return nil
    }
    
    var arregloARegresar = [Int]()
    
    for numero in numerosAProbar{
        if condicion(numero){
            arregloARegresar.append(numero)
        }
    }
    
    return arregloARegresar
}

func mayorATres (numero: Int) -> Bool {
    return numero > 3
}

let misNumeros = [-5,23,6,25,0,-34,4]
print(numerosQueCumplenConUnaCondicion(numerosAProbar: misNumeros, condicion: mayorATres)!)

let multiplosDeCinco = {
    (numero: Int) -> Bool in
    return (numero % 5) == 0
}

print(numerosQueCumplenConUnaCondicion(numerosAProbar: misNumeros, condicion: multiplosDeCinco)!)

//definir funcion dentro del argumento de la funcion siendo ejecutada
var numerosPrimos = numerosQueCumplenConUnaCondicion(numerosAProbar: misNumeros, condicion: {
    (numero: Int) -> Bool in
    if numero < 2 {
        return false
    }
    
    for i in 2..<numero {
        if numero % i == 0 {
            return false
        }
    }
    
    return true
})

//pasar una variable como funcion
print("Tus primos son: \(numerosPrimos!)")

//CLOSURES: ejecucion de una funcion dentro de otra funcion
var familiaSimpson = ["Marge", "Bart", "Lisa", "Maggie", "Homero", "Ayudante de Santa", "Abe", "Patty", "Selma", "Bola de Nieve II", "Herb", "Hugo", "Mona"]

//orden alfabetico
print(familiaSimpson.sorted()) //ordena una copia
print(familiaSimpson)
familiaSimpson.sort() //ordena el original
print(familiaSimpson)

func ordenaHaciaAtras (string1: String, string2: String) -> Bool {
    return string1 > string2
}

print(familiaSimpson.sorted(by: ordenaHaciaAtras(string1:string2:)))

//definicion inline
let ordenaHaciaAtrasInLine = {
    (string1: String, string2: String) -> Bool in
    return string1 > string2
}

print(familiaSimpson.sorted(by: ordenaHaciaAtrasInLine))

print(familiaSimpson.sorted(by: { (string1: String, string2: String) -> Bool in
    return string1 > string2
}))

print(familiaSimpson.sorted(by: { (string1, string2) -> Bool in
    return string1 > string2
}))

print(familiaSimpson.sorted(by: { (string1, string2) -> Bool in
    string1 > string2
}))

print(familiaSimpson.sorted(by: { $0 > $1 }))

print(familiaSimpson.sorted(by: > ))
