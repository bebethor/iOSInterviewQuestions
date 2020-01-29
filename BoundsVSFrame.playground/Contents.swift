import UIKit


//BOUNDS VS FRAME

// Frame: Teniendo una UIView de ejemplo, el frame es su posicón relativa a su super view o vista padre.
let view = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 60, height: 60))

// Bounds: Teniendo una UIView de ejemplo, el bounds es su posición relativa a si misma. El origen por defecto de los ejes x,y serían 0,0. Esto es la esquina superior izquierda.
view.frame.origin = CGPoint(x: 0.0, y: 0.0)
