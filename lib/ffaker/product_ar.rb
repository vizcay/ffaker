# encoding: utf-8
# => author: Pablo Vizcay github.com/vizcay

module Faker
  module ProductAR
    extend ModuleUtils
    extend self

    def brand
      BRANDS.rand
    end

    def product_name
      case rand(2)
      when 0
        "#{NOUN.rand} #{ADJ.rand} #{model}"
      when 1
        "#{NOUN.rand} #{ADJ.rand}"
      end
    end

    def product
      "#{brand} #{product_name}"
    end

    def letters(n)
      max = n.is_a?(Range) ? n.to_a.shuffle.first : n
      (0...max).map { LETTERS.rand.upcase }.join
    end

    def model
      case rand(2)
      when 0 then "#{LETTERS.rand.upcase}#{rand(90)}"   # N90
      when 1 then "#{letters(1..rand(1..2))}-#{rand(9900)}"         # N-9400
      end
    end

    BRANDS = k %w(Adidas Nike Garbarino Puma Longvie Topper Logitech)

    ADJ = k %w(Aereo Automático Poderoso Audible Alta-Definición GPS Portable de-Disco Eléctrico Video de-Entrada
      de-Salida Directo Remoto Digital)
    NOUN = k %w(Filtro Compresor Sistema Visor Montaje Adaptador Amplificador Puente Kit Transmisor Receptor
      Sintonizador Controlador Componente)
  end
end
