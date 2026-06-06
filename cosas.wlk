object knightRider {
    method peso(){
        return 500
    }
    method nivelPeligrosidad(){
        return 10
    }

}

object bumblebee {
    var transformacionActual = modoAuto

    method peso(){
        return 800
    }
    method nivelPeligrosidad(){
        return transformacionActual.nivelPeligrosidad()
    }

    method cambiarTransformacion() {
        if (transformacionActual == modoAuto) {
            transformacionActual = modoRobot
        } else {
            transformacionActual = modoAuto
        }
    }
}

object modoAuto{
    method peligrosidad(){
        return 15
    }
}

object modoRobot{
    method peligrosidad(){
        return 30
    }
}

object paqueteLadrillos{
    var cantidadLadrillos = 10

    method cambiarCantidadLadrillos(nuevaCantidad){
        cantidadLadrillos = nuevaCantidad
    }

    method peso(){
        return cantidadLadrillos * 2
    }
    
    method nivelPeligrosidad(){
        return 2
    }
}


object arenaGranel{
    var peso = 10
    method cambiarPeso(nuevoPeso){
        peso = nuevoPeso
    }
    method peso(){
        return peso
    }
    method nivelPeligrosidad(){
        return 1
    }
    
}

object bateriaAntiAerea {
    var estadoBateria = bateriaDescargada 

    method peso() {
        return estadoBateria.peso()
    }

    method nivelPeligrosidad() {
        return estadoBateria.nivelPeligrosidad()
    }

    method cambiarEstadoBateria() {
        if (estadoBateria == bateriaDescargada) {
            estadoBateria = bateriaCargada
        } else {
            estadoBateria = bateriaDescargada
        }
    }
}

object bateriaCargada{
    const property peso = 300
    const property nivelPeligrosidad = 100
}

object bateriaDescargada{
    const property peso = 200
    const property nivelPeligrosidad = 0
}

object contenedorPortuario{
    method peso(){
        return 100 + interiorContenedor.sum()
    }
    method nivelPeligrosidad(){
        return interiorContenedor.nivelPeligrosidad().max()
    }

    var interiorContenedor = []

    method agregarCosasAlContenedor(objeto){
        interiorContenedor = interiorContenedor + objeto
    }

    method quitarCosasAlContenedor(objeto){
        interiorContenedor -= interiorContenedor.remove(objeto)
    }


}

object residuosRadioactivos{
    var peso = 100
    method cambiarPeso(nuevoPeso){
        peso = nuevoPeso
    }
    method nivelPeligrosidad(){
        return 200
    }
}

object embalajeSeguridad{
    method peso(){
        return objetoEnvuelto.peso()
    }
    var objetoEnvuelto = residuosRadioactivos
    method cambiarObjetoEnvuelto(objetoNuevo){
        objetoEnvuelto = objetoNuevo
    }
    method nivelPeligrosidad(){
        return (objetoEnvuelto.nivelPeligrosidad() / 2)
    }
}