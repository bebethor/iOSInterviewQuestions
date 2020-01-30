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

throw errorDetails(code: 100, message: "This eagle is a cow", error: .cantFly)
