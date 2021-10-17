require_relative "unidad"
require_relative "categoria"

def generarListaDeUnidades(cantidadDePiqueros,cantidadDeArqueros,cantidadDeCaballeros)
    listaDeUnidades = []
    cantidadDePiqueros.times{listaDeUnidades.append(Unidad.new(Piquero.new()))}
    cantidadDeArqueros.times{listaDeUnidades.append(Unidad.new(Arquero.new()))}
    cantidadDeCaballeros.times{listaDeUnidades.append(Unidad.new(Caballero.new()))}
    return listaDeUnidades
end

class Chinos 

    def unidadesIniciales()
        generarListaDeUnidades(2,25,2)
    end
end



class Ingleses 
    def unidadesIniciales()
        generarListaDeUnidades(10,10,10)
    end
end


class Bizantinos 

    def unidadesIniciales()
        generarListaDeUnidades(5,8,15)
    end
end


