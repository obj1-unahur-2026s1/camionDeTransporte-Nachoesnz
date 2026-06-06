object knightRider {
    method peso(){
        return 500
    }
    method nivelPeligrosidad(){
        return 10
    }

    method bultos(){
        return 1
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
    method bultos(){
        return 2
    }
    
}

object modoAuto{
    method nivelPeligrosidad(){
        return 15
    }
}

object modoRobot{
    method nivelPeligrosidad(){
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
    method bultos() {
        return if (cantidadLadrillos <= 100) {
            1
        } else if (cantidadLadrillos.between(101, 300)) {
            2
        } else {
            3
        }
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
    
    method bultos(){
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
    method bultos() {
        return if (estadoBateria == bateriaCargada) 2 else 1
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
        return 100 + interiorContenedor.sum({cargaInterior => cargaInterior.peso()})
    }
    method nivelPeligrosidad(){
        return interiorContenedor.max({ carga => carga.nivelPeligrosidad() }).nivelPeligrosidad()
    }

    const interiorContenedor = []

    method agregarCosasAlContenedor(objeto){
        interiorContenedor.add(objeto)
    }

    method quitarCosasAlContenedor(objeto){
        interiorContenedor.remove(objeto)
    }

    method bultos() {
        return 1 + interiorContenedor.sum({ carga => carga.bultos() })
    }

}

object residuosRadioactivos{
    var peso = 100
     method cambiarPeso(nuevoPeso){
        peso = nuevoPeso
    }

    method peso(){
        return peso
    }
    method nivelPeligrosidad(){
        return 200
    }
    method bultos(){
        return 1
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
        return objetoEnvuelto.nivelPeligrosidad() / 2
    }
    method bultos(){
        return 2
    }    
}