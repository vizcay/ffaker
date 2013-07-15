# encoding: utf-8
# => author: Pablo Vizcay github.com/vizcay

module Faker
  module NameAR
    include Faker::Name
    extend ModuleUtils
    extend self

    MALE_FIRST_NAMES = k %w(
      Adolfo Adrián Agustín Alan Alberto Aldo Alejandro Alfonso Alonso Andrés Ángel Armando Arturo Abel
        Antonio Ariel Aurelio Augusto Aníbal Anselmo Amado
      Benjamin Bruno Bernardo Benancio
      Carlos Carmelo César Cristian Claudio Clemente Cosme
      Daniel David Darío Diego Domingo Demetrio
      Eduardo Ezequiel Elías Emanuel Eugenio Emilio Emiliano Enrique Ernesto
      Fernando Francisco Fabián Felipe Félix Francisco Fidel Feliciano Fabricio
      Gerardo Germán Guillermo Gregorio Gustavo Guillermo
      Héctor Hernán Horacio Hugo Humberto Horacio Homero
      Ignacio Isaac Ismael Iván Isidro
      Jesús Jerónimo Javier Jorge José Juan Jacinto Jacobo Julián Joel Joaquín Juventino
      Kevin
      Leonardo León Luis Leonel
      Martín Manuel Miguel Marco Martín Mario Marcelo Marcelino Margarito Mauro Mauricio Maximiliano Moisés
      Néstor Norberto Nicolás
      Octavio Oscar Omar Osvaldo Orlando Omar
      Pablo Pedro Patricio Pascual
      Rafael Ramón Ricardo René Roberto Rodolfo Rodrigo Rafael Raúl Román Rubén Roque Rolando Rogelio
      Salvador Sebastián Santiago Sergio Samuel Saúl Silvio Simón
      Tomás
      Ulises Uriel
      Vicente Víctor Valentín Victoriano
    )

    FEMALE_FIRST_NAMES = k %w(
      Adriana Aida Alba Alejandra Alicia Ana América Anabel Andrea Anahí Araceli Angélica Ángela Aurora Abigail
        Abril Alma Amanda Anabel Azucena
      Beatriz Brenda Blanca Bárbara Belén Brenda
      Carla Catalina Cecilia Celia Cintia Claudia Cristal Cristina Carolina Casandra Carmen Camila
      Clara Clementina Constanza
      Delia Dulce Diana Dania Daniela Denisse
      Elba Eva Edith Elena Elisa Elsa Elvira Emilia Ema Erica Esmeralda
      Fátima Fernanda Flor Francisca
      Gabriela Georgina Gloria Geraldine Guadalup Gladis
      Hilda Helena
      Irene Iris Ivonne Ingrid Irma Isabel
      Jaqueline Juana Judith Jazmín Jimena Josefina Julia
      Karen Karina
      Laura Leticia Liliana Lorena Lucero Luz Luisa Lucía
      Marina Mariana María Maira Maite Marisol Marisa Marcela Maricela Mariel Melina Miriam Marcia Margarita Magali Mara
        Mirna Mónica Marta Marlene Matilde
      Norma Natalia Nancy Nadia Nohemí Norma Nuria
      Olga Olivia
      Paola Paula Patricia Priscila Paloma Pamela Perla Paz Paulina
      Raquel Rebeca Rosa Rocío Roxana Rosario Ruth Rita
      Sandra Sara Silvia Sofía Susana Sonia
      Tania Tatiana Teresa Tamara
      Ursula
      Verónica Vanesa Viviana Virginia Vera
      Zaira
    )

    FIRST_NAMES = k MALE_FIRST_NAMES + FEMALE_FIRST_NAMES

    LAST_NAMES = k %w(
      Acosta Acuña Agüero Aguirre Álvarez Andrada Arce Arias Ávila
      Barrios Benítez Blanco Bravo
      Cabrera Cáceres Campos Cardozo Carrizo Castillo Castro Chávez Córdoba Coronel Correa Cruz
      Díaz Domínguez Duarte
      Escobar
      Farías Fernández Ferreyra Figueroa Flores Franco
      García Giménez Godoy Gómez González Gutiérrez
      Hernández Herrera
      Juárez
      Ledesma Leguizamón Leiva López Lucero Luna
      Maidana Maldonado Mansilla Martin Martínez Medina Méndez Mendoza Miranda Molina Montenegro Morales Moreno Moyano Muñoz
      Navarro Núñez
      Ojeda Olivera Ortíz
      Páez Paz Peralta Pereyra Pérez Ponce
      Quiroga
      Ramírez Ramos Ríos Rivero Rodríguez Rojas Roldán Romero Ruiz
      Sánchez Silva Soria Sosa Soto Suárez
      Toledo Torres
      Valdéz Vargas Vázquez Vega Vera Villalba
    )

    MALE_PREFIXES = k %w(Sr. Dr. Lic. Ing.)
    FEMALE_PREFIXES = k %w(Sra. Srita. Dra. Lic. Ing.)
    PREFIXES = k %w(Lic. Ing.)

    # Full name according to gender and prefix, possibly with middle_name
    def full_name(gender = :any, prefix = false)
      if prefix
        full_name_prefix(gender)
      else
        full_name_no_prefix(gender)
      end
    end

    # Full name with prefix according to gender, possibly with middle_name
    def full_name_prefix(gender = :any)
      case gender
        when :any then
          case rand(9)
            when 0, 3, 6, 8 then "#{female_prefix} #{female_name} #{last_name}"
            else "#{male_prefix} #{male_name} #{last_name}"
          end
        when :male then "#{male_prefix} #{male_name} #{last_name}"
        when :female then "#{female_prefix} #{female_name} #{last_name}"
        else raise ArgumentError, "Invalid gender, must be one of :any, :male, :female"
      end
    end

    # Full name with no prefix according to gender, possibly with middle_name
    def full_name_no_prefix(gender = :any)
      case gender
        when :any then
          case rand(9)
            when 0, 3, 6, 8 then "#{female_name} #{last_name}"
            else "#{male_name} #{last_name}"
          end
        when :male then "#{male_name} #{last_name}"
        when :female then "#{female_name} #{last_name}"
        else raise ArgumentError, "Invalid gender, must be one of :any, :male, :female"
      end
    end

    def male_name
      first_name(:male)
    end

    def female_name
      first_name(:female)
    end

    def name(gender = :any)
      case gender
        when :any then FIRST_NAMES.rand
        when :male then MALE_FIRST_NAMES.rand
        when :female then FEMALE_FIRST_NAMES.rand
        else raise ArgumentError, "Invalid gender, must be one of :any, :male, :female"
      end
    end
    alias_method :middle_name, :name
    alias_method :first_name, :name

    def last_name
      LAST_NAMES.rand
    end

    def prefix
      PREFIXES.rand
    end

    def male_prefix
      MALE_PREFIXES.rand
    end

    def female_prefix
      FEMALE_PREFIXES.rand
    end
  end
end
