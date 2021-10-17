class Entrenamiento 

    def initialize(categoria)
        @categoria = categoria
    end

    def costo()
        @categoria.costoDeEntrenamiento()
    end

    # La fuerza que me da cada entrenamiento depende de la categoría de unidad a la que está asociado.
    def puntajeDeFuerzaGanado()
        @categoria.puntajeDeFuerzaGanadoPorEntrenamiento()
    end

end