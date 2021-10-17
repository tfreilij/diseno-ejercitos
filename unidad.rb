=begin

Una unidad tendra una categoria asociada (piquero, arquero o caballero)

Veamos una secuencia de acciones de una unidad:

1) empieza siendo un piquero (puntaje base es 5)
2) entrena dos veces ( aumenta 3 + 3 puntos y tiene un costo de 10 + 10 monedas)
3) se transforma en arquero ( puntaje base ahora será 7 y tendrá un costo de 30 monedas)
4) como arquero entrenar dos veces ( puntaje aumenta 7 + 7 y tendrá un costo de 20 + 20 monedas)


A la unidad se le asocia un conjunto de entrenamientos y los mismos tendrán asociado 
un objeto que permitirá saber si fue un entrenamiento como piquero, arquero o caballero. 

De esta forma, saber el costo de entrenamientos y puntaje
total se puede calcular a partir de este "historial de entrenamientos"

Asumo que si me transformo en un nuevo tipo de unidad, mi puntaje de fuerza 
será el nuevo puntaje base que me da esta categoría más la sumatoria 
de los puntos que me dieron los entrenamientos anteriores.


=end

require_relative "entrenamiento"
require_relative "transformacion"
require_relative "estado"

class Unidad  
    def initialize(categoria)  
        @categoria = categoria
        @entrenamientos = []
        @transformaciones = []
        @estado = EnServicio.new()
    end
    
    def entrenar(miEjercito)
        if (miEjercito.oro >= @categoria.costoDeEntrenamiento)
            @entrenamientos.append(Entrenamiento.new(@categoria))
        end
    end

    def oroInvertidoEnEntrenamientos()
        @estado.oroInvertidoEnEntrenamientos(@entrenamientos)
    end

    def oroInvertidoEnTransformaciones()
        @estado.oroInvertidoEnTransformaciones(@transformaciones)
    end

    def puntajeDeFuerza()
        @estado.puntajeDeFuerza(@entrenamientos, @transformaciones)
    end

    def transformar(miEjercito)
        if (miEjercito.oro >= @categoria.costoDeTransformacion)
            @transformaciones.append(Transformacion.new(@categoria))
            @categoria = @categoria.transformar
        end
    end
    
    def eliminar()
        @estado = Eliminada.new()
        
    end
end


