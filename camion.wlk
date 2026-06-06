object camion {

    const coleccionCargas = []
    method peso(){
        return 1000 + coleccionCargas.sum({carga => carga.peso()})
    }

    method sumarCarga(carga){
        coleccionCargas.add(carga)
    }

    method descargarCarga(carga){
        coleccionCargas.remove(carga)
    }

    method todaLaCargaEsPar(){
        return coleccionCargas.all({carga => carga.peso().even()})
    }

    method hayUnaCargaIgualA(cargaBuscada){
        return coleccionCargas.any({carga => carga.peso() == cargaBuscada})
    }

    method primerElementoConNivelPeligrosidad(nivelPeligrosidad){
        return coleccionCargas.find({carga => carga.peligrosidad() == nivelPeligrosidad})
    }

    method cargasQueSuperanNivelPeligrosidad(nivelPeligrosidad){
        return coleccionCargas.filter({carga => carga.peligrosidad() > nivelPeligrosidad})
    }

    method camionExcedidoDePeso(){
        return self.peso() > 2500
    }

    method validoParaCircular(nivelPeligrosidad){
        return !self.camionExcedidoDePeso() && self.cargasQueSuperanNivelPeligrosidad(nivelPeligrosidad).isEmpty()
    }


    //////////////////

    method tieneAlgunaCosaQuePesaEntre(minimo, maximo) {
        return coleccionCargas.any({ carga => carga.peso().between(minimo, maximo) })
    }

    method cosaMasPesada() {
        if (coleccionCargas.isEmpty()) {
            self.error("No se puede calcular la cosa más pesada porque el camión está vacío")
        }
        return coleccionCargas.max({ carga => carga.peso() })
    }


    // Obtener la cantidad total de bultos transportados
    method cantidadTotalBultos() {
        return coleccionCargas.sum({ carga => carga.bultos() })
    }
}



