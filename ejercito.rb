require_relative "batalla"
require_relative "unidad"
require_relative "categoria"

class Ejercito  
  def initialize(civilizacion)  
    @civilizacion = civilizacion

    # Corresponde a la civilizacion decirme las unidades con las que empiezo
    @unidades = civilizacion.unidadesIniciales
    @historialDeBatallas = []
    
  end 
  
  def atacar(otroEjercito)
    Batalla.new(self,otroEjercito)
  end  

  def entrenarUnidad(unaUnidad)
    unaUnidad.entrenar(self)
  end

  def transformarUnidad(unaUnidad)
    unaUnidad.transformar(self)
  end

  # Mi cantidad de oro será el valor de base de 1000 con el que empiezo, sumando el oro que gane en batallas y a eso le resto lo que invertí en unidades
  def oro()
    
    1000 + self.oroGanadoEnBatallas - self.oroInvertidoEnUnidades
  end

  # Acá calculo el puntaje del ejército, el cual es la sumatoria de puntajes de cada una de sus unidades.
  def puntajeDeFuerza()
    contador = 0
    @unidades.each{ |unidad| contador = contador + unidad.puntajeDeFuerza}
    return contador
  end

  # Calculo el oro ganado en batallas y el oro que invertí para entrenar y transformar unidades.
  def oroGanadoEnBatallas()

    contador = 0
    @historialDeBatallas.each{ |batalla| contador = contador + batalla.premioEnOro}
    return contador
  end

  def oroInvertidoEnUnidades()
    contador = 0
    @unidades.each{ |unidad| contador = contador + unidad.oroInvertidoEnTransformaciones + unidad.oroInvertidoEnEntrenamientos}
    return contador
  end


  # Luego de atacar o ser atacado, un ejército agregar un objeto que representa una batalla terminada. Luego le pregunta a la batalla cuáles fueron
  #   las consecuencias, ya sea que gané oro, o que perdí unidades.
  def batallaTerminada(unaBatallaTerminada)
    @historialDeBatallas.append(unaBatallaTerminada)
    unaBatallaTerminada.consecuenciasDeLaBatalla(self)
  end

  def eliminarUnidadDeMasPuntaje()

    # Primero busco la unidad de más puntaje de fuerza 
    unidadDeMasPuntaje = @unidades[0]
    
    @unidades.each{ |unidad | 
      if ( unidadDeMasPuntaje.puntajeDeFuerza < unidad.puntajeDeFuerza )
        unidadDeMasPuntaje = unidad
      end
    }

    # Le envío el mensaje de "eliminar". No la saco de la lista de unidades pero le cambio la categoría a "eliminada"
    # De esta manera no aportará puntaje de fuerza al ejército. 
    unidadDeMasPuntaje.eliminar

  end
end  