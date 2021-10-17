class Transformacion 

    def initialize(categoria)
        @categoria = categoria
    end

    def costo()
        @categoria.costoDeTransformacion()
    end
end