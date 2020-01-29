import UIKit


//Filter, Map, Reduce

struct Device {
    var type: String
    var price: Float
    var color: String
}

var myiMacPro      = Device(type: "iMac Pro", price: 4999.00, color: "Space Grey")
var myiPhoneXS     = Device(type: "iPhone", price: 799.0, color: "Black")
var myiPhone11     = Device(type: "iPhone", price: 1000.00, color: "Space Grey")
var myIpad         = Device(type: "iPad", price: 400, color: "Space Grey")
var myAppleWatch   = Device(type: "Apple Watch", price: 500.00, color: "Space Grey")
var myAppleTv      = Device(type: "Apple TV", price: 200.00, color: "Black")

let myDevices = [myiMacPro, myiPhoneXS, myiPhone11, myIpad, myAppleWatch, myAppleTv]

// FILTER:Filtrando. Con la función filter tenemos la opción de seleccionar de un array determinados elementos en función de una condición y obtener como resultado solamente aquellos que cumpla dicha condición. Esto es aplicable a cualquier tipo de condición cuyo resultado sea true o false, lo que nos abre posibilidades a multitud de opciones.

//Sacamos todos los dispositivos que sean iphone de la forma clásica con un bucle for
var myPhones: [Device] = []
for device in myDevices {
    if device.type == "iPhone" {
        myPhones.append(device)
    }
}
 
print(myPhones)

//Ahora con filter
let iPhones = myDevices.filter({ return $0.type == "iPhone"}) // en este caso $0 corresponde a la variable devie del bucle for anterior
print(iPhones)


// MAP: transformando. La función map lo que hace es ejecutar una función en todos los elementos de un array, donde construimos dicha función de transformación en base a la referencia genérica de los valores. Es decir, dentro de la llamada a map, la referencia $0 representa el dato en sí dentro nuestro array.

let canadianPrices: [Float] = myDevices.map({ return $0.price * 1.2 })
print(canadianPrices)
