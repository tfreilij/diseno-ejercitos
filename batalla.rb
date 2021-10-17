class Batalla 

    def initialize(unEjercito, otroEjercito)

        if ( unEjercito.puntajeDeFuerza > otroEjercito.puntajeDeFuerza )
            unEjercito.batallaTerminada(BatallaGanada.new())
            otroEjercito.batallaTerminada(BatallaPerdida.new())
        elsif ( unEjercito.puntajeDeFuerza < otroEjercito.puntajeDeFuerza )
            unEjercito.batallaTerminada(BatallaPerdida.new())
            otroEjercito.batallaTerminada(BatallaGanada.new())
        else
            unEjercito.batallaTerminada(BatallaEmpatada.new())
            otroEjercito.batallaTerminada(BatallaEmpatada.new())          
        end
    end

end

class BatallaGanada

    def premioEnOro()
        100
    end

    def consecuenciasDeLaBatalla(unEjercito)
        # Cuando gano una batalla no hay consecuencias positivas ni negativas para mis unidades.
        # Esto lo puse para que tengan polimorfismo entre las distintas categorías de batallas.
       
        # Si bien no es algo deseable, devolver un objeto Nil en este caso no es algo que perjudique.
    end
end

class BatallaPerdida 

    def premioEnOro()
        0
    end

    def consecuenciasDeLaBatalla(unEjercito)
        2.times { unEjercito.eliminarUnidadDeMasPuntaje }
    end
end

class BatallaEmpatada

    def premioEnOro()
        0
    end

    def consecuenciasDeLaBatalla(unEjercito)
        # Para simplificar, en caso de empate, cada ejército pierde su unidad de mayor puntaje
        unEjercito.eliminarUnidadDeMasPuntaje
    end
end