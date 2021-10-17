# La transformación consiste en cambiar el objeto al que hace referencia la categoría de la unidad.


class Categoria 

    def esEliminada?
        false
    end
end


class Piquero < Categoria

    def puntosDeFuerzaBase()
        5
    end

    def transformar()
        Arquero.new()  
    end

    def puntajeDeFuerzaGanadoPorEntrenamiento()
        3
    end

    def costoDeEntrenamiento()
        10
    end

    def costoDeTransformacion()
        30
    end

    
end


class Arquero < Categoria

    def puntosDeFuerzaBase()
        10
    end

    def transformar()
        Caballero.new()
    end

    def puntajeDeFuerzaGanadoPorEntrenamiento()
        7
    end

    def costoDeEntrenamiento()
        20
    end

    def costoDeTransformacion()
        40
    end

end




class Caballero < Categoria

    def puntosDeFuerzaBase()
        20
    end

    def transformar()
        # En el caso de los caballeros o unidades eliminadas, no existe la transformación así que devuelve un objeto instancia de la misma clase
        Caballero.new()
    end

    def puntajeDeFuerzaGanadoPorEntrenamiento()
        10
    end

    def costoDeEntrenamiento()
        30
    end

    def costoDeTransformacion()
        # Como no se puede transformar un caballero, en caso de que le pidan hacer la transformación, no aportará nuevos costos.
        0
    end

end


class Eliminada < Categoria 

    def transformar()
        # Explicado en Caballero
        Eliminada.new()
    end

    # Devolviendo 0 en todos estos métodos, me aseguro de que si la unidad "eliminada" la hacen entrenar, entonces no aportará costos ni aumentará su fuerza.
    def puntosDeFuerzaBase()
        0
    end

    def costoDeEntrenamiento()
        0
    end

    def costoDeTransformacion()
        0
    end

    def puntajeDeFuerzaGanadoPorEntrenamiento()
        0
    end

    def esEliminada?
        true
    end

end
