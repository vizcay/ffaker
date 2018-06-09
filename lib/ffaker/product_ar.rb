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

    BRANDS = k %w(Atma Siam Philco Phillips Noblex Sanyo Longvie Whirlpool)

    ADJ = k %w(Multifuncion Automático Eficiente Portatil Eléctrico Digital Plus Max 1200W 1000W 800W)
    NOUN = k %w(Aire-Acondicionado Aspiradora Caloventor SMART-TV LED-TV Heladera Freezer Lavarropas
                Secarropas Lavavajillas Lavasecarropas Licuadora Microcomponente Microondas Minicomponente
                Planchita Secador Radiograbador Reproductor-DVD/Blue-Ray Tostador Split)
  end
end
