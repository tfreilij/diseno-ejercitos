class Estado

    def oroInvertidoEnEntrenamientos(entrenamientos)
        contador = 0
        entrenamientos.each{ |entrenamiento| contador = contador + entrenamiento.costo }
        return contador
    end

    def oroInvertidoEnTransformaciones(transformaciones)
        contador = 0
        transformaciones.each{ |unidad| contador = contador + unidad.costo}
        return contador
    end
end

# Si está en servicio, la fuerza la obtengo de la fuerza base de mi categoria sumado a los entrenamientos y transformaciones
# En caso de que me hayan eliminado, entonces no aporto puntos de fuerza al ejército

class EnServicio < Estado

    def puntajeDeFuerza(entrenamientos, categoria)
        
        contador = categoria.puntosDeFuerzaBase
        # puntaje de fuerza = fuerza base que me da mi categoria + todos los entrenamientos que hice previamente.
        entrenamientos.each{ |entrenamiento| contador = contador + entrenamiento.puntajeDeFuerzaGanado}
        return contador

    end
end


class Eliminado < Estado
 
    def puntajeDeFuerza(entrenamientos, categoria)
        0
    end
end