import UIKit

var ene = 0
var feb = 3
var mar = 3
var abr = 6
var may = 1
var jun = 4
var jul = 6
var ago = 2
var sep = 5
var oct = 0
var nov = 3
var dic = 5

var cuenta = 2

func esBisiesto(año: Double) -> Bool{
    var res: Bool = false
    if año.remainder(dividingBy: 4) == 0 || año == 2000{
        res = true
    }
    return res
}

func mesProximoAño(mes: inout Int, año: Double){
    if (esBisiesto(año: año)){
        if (mes == 5){
            mes = 0
        } else if (mes == 6){
            mes = 1
        } else {
            mes += 1
        }
    } else {
        if (mes == 6) {
            mes = 0
        } else {
            mes += 1
        }
    }
}


for año in 1902..<2001 {
    mesProximoAño(mes: &ene, año: Double(año))
    mesProximoAño(mes: &feb, año: Double(año))
    mesProximoAño(mes: &mar, año: Double(año))
    mesProximoAño(mes: &abr, año: Double(año))
    mesProximoAño(mes: &may, año: Double(año))
    mesProximoAño(mes: &jun, año: Double(año))
    mesProximoAño(mes: &jul, año: Double(año))
    mesProximoAño(mes: &ago, año: Double(año))
    mesProximoAño(mes: &sep, año: Double(año))
    mesProximoAño(mes: &oct, año: Double(año))
    mesProximoAño(mes: &nov, año: Double(año))
    mesProximoAño(mes: &dic, año: Double(año))
    if ene == 6 {
        cuenta += 1
    }
    if feb == 6 {
        cuenta += 1
    }
    if mar == 6 {
        cuenta += 1
    }
    if abr == 6 {
        cuenta += 1
    }
    if may == 6 {
        cuenta += 1
    }
    if jun == 6 {
        cuenta += 1
    }
    if jul == 6 {
        cuenta += 1
    }
    if ago == 6 {
        cuenta += 1
    }
    if sep == 6 {
        cuenta += 1
    }
    if oct == 6 {
        cuenta += 1
    }
    if nov == 6 {
        cuenta += 1
    }
    if dic == 6 {
        cuenta += 1
    }
    //print("\(año)")
}


print("\(cuenta)")
