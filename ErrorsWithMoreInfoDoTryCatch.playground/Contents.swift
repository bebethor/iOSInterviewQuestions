import UIKit

// https://applecoding.com/trucos/crear-errores-swift-mas-informacion

/*: crear errores en Swift con más información */

/*: Swift tiene muchas posibilidades en sus implementaciones, pero muchas veces las más complejas o que pueden sacar mayor partido a nuestro código, no son tan fáciles de averiguar. Si estamos acostumbrados a sacar partido a la gestión de errores de Swift a través del protocolo Error con el uso de enumeraciones, sabremos que la única información que podemos enviar es simplemente un valor enumerado (un case) que nos diga a grandes rasgos qué ha pasado.

Pero, ¿y si queremos más información? ¿y si tenemos un sistema de códigos de error que generamos en nuestro proyecto y queremos además un mensaje más clarificador para el desarrollador, en caso de hacer una librería externa para reutilizar en más de un proyecto?

Para ese caso, el protocolo Error también puede aplicarse en un struct y esto nos permite enviar información más detallada de errores usando esta estructura de dato, en vez de una enumeración solamente. Al estar conformado el struct, podremos hacer un throw desde una función throws (o closure) enviando más información y más clara. La que nosotros queramos definir.

Vamos a ver un ejemplo. Creamos primero un struct que vamos a conformar a Error y que tendrá la información que vamos a usar para identificar o informar del error. No tiene que tener condiciones especiales. Simplemente, lo conformamos y nada más. */

struct errorDetails: Error {
    enum EagleError {
        case cantFly
        case cantRun
    }
    var code:Int
    var message:String
    var error:EagleError
}
/*: Hemos creado un struct de detalles de error. Dentro tenemos una enumeración que nos haga la misma función que ya nos hacía el enum conformado con Error. Luego, una serie de valores que queremos usar como un código (code), un mensaje (message) y por último la variable que contendrá la enumeración, obviamente.

Hecho esto, ahora podemos lanzar errores con mayor detalle poniendo este throw en cualquier función o closure de tipo throws como: */

throw errorDetails(code: 100, message: "This eagle is a cow", error: .cantRun)

/*: ¿Cómo capturamos el error para acceder a la información? En el catch tendremos que hacer un let capturando el valor que le entra y haciendo un casting hacia el tipo errorDetails que hemos creado (que como está conformado con Error será completamente válido para el catch).

Vamos a ver el throw en una función que de error como esta: */


func doyError() throws {
    throw errorDetails(code: 100, message: "This eagle is a cow", error: .cantFly)
}

/* Y ahora hacemos el consabido do, try y catch. Aquí la diferencia radica en que, mientras cuando usamos Error en un enum, podemos tener diferentes catch anidados como si fuera un switch, en este caso solo tendremos un único catch que capturará y convertirá al tipo del error personalizado y a partir de ahí con if case o bien con un switch podemos ir evaluando el tipo de error que nos devuelve la enumeración que forma parte del tipo errorDetails. */

do {
    try doyError()
} catch let error as errorDetails {
    if case .cantFly = error.error {
        print("ERROR: \(error.code), \(error.message), \(error.error)")
    }
    if case .cantRun = error.error {
        print("ERROR: \(error.code), \(error.message), \(error.error)")
    }
}



/* De esta simple forma, podemos conseguir tener unos errores con más contenido, más detallados y que nos permiten saber más información.

Espero que os haya sido práctica este «truco» y nos vemos en el próximo artículo. Y recordad, que si queréis saberlo todo sobre Swift, podéis comprar nuestro curso de Udemy o nuestro libro (los tenéis en el lateral) o contactarnos en Apple Coding Academy donde impartimos formación para empresas y particulares. Un saludo y Good Apple Coding. */
