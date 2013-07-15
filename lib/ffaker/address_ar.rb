# encoding: utf-8
# => author: Pablo Vizcay github.com/vizcay

module Faker
  module AddressAR
    extend ModuleUtils
    extend self

    # @deprecated US specific address info. Moved into {AddressUS}
    def zip_code
      warn '[zip_code] is deprecated. For US addresses please use the AddressUS module'
      Faker::AddressUS.zip_code
    end

    def us_state
      warn '[us_state] is deprecated. For US addresses please use the AddressUS module'
      Faker::AddressUS.state
    end

    def us_state_abbr
      warn '[state_abbr] is deprecated. For US addresses please use the AddressUS module'
      Faker::AddressUS.state_abbr
    end
    # end US deprecation

    def city_prefix
      CITY_PREFIXES.rand
    end

    def city_suffix
      CITY_SUFFIXES.rand
    end

    def city
      case rand(4)
      when 0 then '%s %s%s' % [city_prefix, Name.first_name, city_suffix]
      when 1 then '%s %s'   % [city_prefix, Name.first_name]
      when 2 then '%s%s'    % [Name.first_name, city_suffix]
      when 3 then '%s%s'    % [Name.last_name, city_suffix]
      end
    end

    def street_suffix
      STREET_SUFFIX.rand
    end

    def building_number
      case rand(8)
      when 0
        rand(1...999)
      when 1
        rand(1...99999)
      else
        rand(1...9999)
      end
    end

    def street_name
      STREETS.rand
    end

    def street_address(include_secondary = false)
      str = "#{street_name} #{building_number}"
      str << " #{secondary_address}" if include_secondary
      str
    end

    def secondary_address
      Faker.numerify(SEC_ADDR.rand)
    end

    # @deprecated UK specific address info. Moved into {AddressUK}
    # UK Variants
    def uk_county
      warn '[uk_county] is deprecated. For UK addresses please use the AddressUK module'
      Faker::AddressUK.county
    end

    def uk_country
      warn '[uk_country] is deprecated. For UK addresses please use the AddressUK module'
      Faker::AddressUK.country
    end

    def uk_postcode
      warn '[uk_postcode] is deprecated. For UK addresses please use the AddressUK module'
      Faker::AddressUK.postcode
    end
    # end UK deprecation

    def neighborhood
      NEIGHBORHOOD.rand
    end

    def country
      COUNTRY.rand
    end

    COMPASS_DIRECTIONS = k %w(North East West South)

    CITY_PREFIXES = k(COMPASS_DIRECTIONS + %w(New Lake Port))

    CITY_SUFFIXES = k %w(town ton land ville berg burgh borough bury view port
                        mouth stad furt chester mouth fort haven side shire)

    STREETS = k [
      'Av. 27 de Febrero', 'Av. 9 de Julio', 'Av. Achával Rodríguez', 'Av. Acoyte', 'Av. Adolfo Berro', 'Av. Albarellos',
      'Av. Alcorta', 'Av. Alicia Moreau de Justo', 'Av. Almafuerte', 'Av. Álvarez Jonte', 'Av. Álvarez Thomas',
      'Av. Alvear', 'Av. Ángel Gallardo', 'Av. Antártida Argentina', 'Av. Aranguren', 'Av. Argentina', 'Av. Asamblea',
      'Av. Asturias', 'Av. Avellaneda', 'Av. Bacacay', 'Av. Belgrano', 'Av. Belisario Roldán', 'Av. Boedo', 'Av. Boyacá',
      'Av. Brasil', 'Av. Cabildo', 'Av. Calabria', 'Av. Callao', 'Av. Carabobo', 'Av. Carrasco', 'Av. Casares',
      'Av. Caseros', 'Av. Castañares', 'Av. Castillo', 'Av. Chiclana', 'Av. Chile', 'Av. Chorroarín', 'Av. Cobo',
      'Av. Colombia', 'Av. Comodoro Py', 'Av. Congreso', 'Av. Córdoba', 'Av. Coronel Bonorino', 'Av. Coronel Díaz',
      'Av. Coronel Roca', 'Av. Corrientes', 'Av. Crámer', 'Av. Crisólogo Larralde', 'Av. Curapaligüe', 'Av. Daract',
      'Av. de la Rábida', 'Av. del Campo', 'Av. del Corro', 'Av. del Fomentista', 'Av. del Libertador',
      'Av. de los Constituyentes', 'Av. de los Incas', 'Av. de los Inmigrantes', 'Av. de los Italianos', 'Av. de Mayo',
      'Av. Derqui', 'Av. Díaz Vélez', 'Av. Directorio', 'Av. Dorrego', 'Av. Eduardo Madero', 'Av. Elcano',
      'Av. Emilio Castro', 'Av. Emilio Mitre', 'Av. Entre Ríos', 'Av. Escalada', 'Av. España', 'Av. Estado de Israel',
      'Av. Eva Perón', 'Av. Federico Lacroze', 'Av. Fernández de la Cruz', 'Av. Figueroa Alcorta', 'Av. Forest',
      'Av. Francisco Beiró', 'Av. Francisco Bilbao', 'Av. Gaona', 'Av. García del Río', 'Av. Garmendia',
      'Av. Gendarmería Nacional', 'Av. General Las Heras', 'Av. General Mosconi', 'Av. General Sarmiento',
      'Av. Griveo', 'Av. Guzmán', 'Av. Independencia', 'Av. Infanta', 'Av. Ing. Huergo', 'Av. Ing. Quartino',
      'Av. Int. Bullrich', 'Av. Int. Cantilo', 'Av. Int. Francisco', 'Av. Int. Güiraldes', 'Av. Int. Noel', 'Av. Iraola',
      'Av. José María Moreno', 'Av. Juan Bautista Alberdi', 'Av. Juan B. Justo', 'Av. Juan Garay', 'Av. Jujuy',
      'Av. Juramento', 'Av. Kennedy', 'Av. Lacarra', 'Av. Lafuente', 'Av. Larrazábal', 'Av. Lastra', 'Av. Leandro N. Alem',
      'Av. Lillo', 'Av. Lisandro de la Torre', 'Av. Lope de Vega', 'Av. Luis María Campos', 'Av. Medrano', 'Av. Melian',
      'Av. Monroe', 'Av. Montes de Oca', 'Av. Nazca', 'Av. Olivera', 'Av. Ortiz de Ocampo', 'Av. Osvaldo Cruz',
      'Av. Paseo Colón', 'Av. Patricias Argentinas', 'Av. Pedro Goyena', 'Av. Pedro Montt', 'Av. Perito Moreno',
      'Av. Piedra Buena', 'Av. Prefectura Naval', 'Av. Pueyrredón', 'Av. Punta Arenas', 'Av. Quintana',
      'Av. Rafael Obligado', 'Av. Ramallo', 'Av. Ramos Mejía', 'Av. Rawson de Dellepiane', 'Av. Remedios',
      'Av. Reservistas Argentinos', 'Av. Ricardo Balbín', 'Av. Riestra', 'Av. Río de Janeiro', 'Av. Rivadavia',
      'Av. Roberto Goyeneche', 'Av. Roca', 'Av. Rosales', 'Av. Ruiz Huidobro', 'Av. Sáenz', 'Av. Sáenz Peña',
      'Av. Salvador Carril', 'Av. Sánchez de Loria', 'Av. San Isidro Labrador', 'Av. San Juan', 'Av. San Martín',
      'Av. San Pedrito', 'Av. Santa Fe', 'Av. Santiago de Compostela', 'Av. Sarmiento', 'Av. Scalabrini Ortiz',
      'Av. Segurola', 'Av. Suárez', 'Av. Tomás Alva Edison', 'Av. Triunvirato', 'Av. Tte. Álvarez', 'Av. Udaondo',
      'Av. Varela', 'Av. Vélez Sársfield', 'Av. Warnes', 'Av. White', '11 de Septiembre', '14 de Julio', '3 de Febrero',
      'Acevedo', 'Adolfo Alsina', 'Agüero', 'Aguilar', 'Aguirre', 'Aizpurúa', 'Álvarez Jonte', 'Amadeo Jacques', 'Amenabar',
      'Ana María Janer', 'Ancaste', 'Andres Ferreyra', 'Arce', 'Arcos', 'Arevalo', 'Árias', 'Arribeños', 'Arroyo',
      'Arturo Jauretche', 'Ascabusi', 'Baez', 'Balbastro', 'Balcarce', 'Batalla del Pari', 'Benito Juárez', 'Besares',
      'Blanco Encalada', 'Bogado', 'Bogotá', 'Bolaños', 'Bolivar', 'Bolivia', 'Bollini', 'Bolonia', 'Bonpland',
      'Boulougne Sur', 'Brandsen', 'Bulgaria', 'Bulnes', 'Butteler', 'Camargo', 'Campos Salles', 'Carapachay',
      'Castillo', 'Cespedes', 'Charcas', 'Ciudad de la Paz', 'Colpayo', 'Conde', 'Conesa', 'Coronel Rohde', 'Correa',
      'Cosquín', 'Costa Rica', 'Cuba', 'Cucha Cucha', 'Cuenca', 'Darragueyra', 'Defensa', 'Deheza', 'Delgado', 'Dragones',
      'Dr. Eduardo Jenner', 'Dr. Emilio R. Coni', 'Dr. F. Aranguren', 'Dr. Pedro I. Rivera', 'Echeverria', 'El Salvador',
      'Emir Mercader', 'Esparza', 'Espinosa', 'Esquiú', 'Estados Unidos', 'Esteves Sagui', 'Estomba',
      'Federico García Lorca', 'Florida', 'Fraga', 'Franklin Delano Roosevelt', 'Galván', 'Gana', 'Gandara', 'Gandhi',
      'García Grande de Zequeira', 'Gascón', 'Gaspar Melchor de Jovellanos', 'General M. A. Rodriguez', 'Gorostiaga',
      'Gorriti', 'Gregorio de Laferrere', 'Guayra', 'Güemes', 'Guzmán', 'Habana', 'Heredia', 'Honduras', 'Husares',
      'Ibáñez', 'Iberá', 'Ing. E. Butty', 'Ituzaingo', 'Jacarandá', 'Jachal', 'Jaramillo', 'Jean Jaures', 'John W. Cooke',
      'Jorge', 'Jorge Newbery', 'José A. Cabrera', 'José Luis Cantilo', 'Juana Azurduy', 'Juana de Arco',
      'Juan Agustín García', 'Juan B. Ambrosetti', 'Juan Bautista Jantin', 'Juan José Naon', 'Juez Magnaud', 'Jufre',
      'Juncal', 'Junín', 'Juramento', 'Lafinur', 'Lanín', 'La Pampa', 'Las Acacias', 'Lascano', 'Lavalle', 'Lavalleja',
      'Lerma', 'Libertad', 'Luis Pasteur', 'Luna', 'Manuela Pedraza', 'Manzanares', 'Mataco', 'Maure', 'Medrano',
      'Mendoza', 'Miguel Navarro Viola', 'Moldes', 'Muñecas', 'Naciones Unidas', 'Nahuel Huapi', 'Namuncurá', 'Ñandutí',
      'Nápoles', 'Natal', 'Navarro', 'Nazarre', 'Nazca', 'Necochea', 'Nepper', 'Neuquén', 'Nevada', 'Newton', 'Nicaragua',
      'Nicolás Repetto', 'Niza', 'Nogoyá', 'Noruega', 'Nueva York', 'Nueva Zelandia', 'Numancia', 'Núñez',
      'Obrero Roberto Núñez', 'O''Gorman', 'Olazábal', 'Olleros', 'Orma', 'Ortega y Gasset', 'Padre Juan B. Neumann',
      'Palpa', 'Paraguay', 'Paroissie', 'Pasco', 'Pedro de Jerez', 'Pedro de Luján', 'Perú', 'Pico', 'Piedras', 'Pinto',
      'Plumerillo', 'Posadas', 'Posta', 'Profesor Pedro Chuttro', 'Pte. Luis Saenz Peña', 'Quesada', 'Ramallo',
      'Ramón Lorenzo Falcón', 'Reconquista', 'Riglos', 'Rojas', 'Romulo S. Naon', 'Rosario', 'Russel', 'Saavedra',
      'Saladillo', 'Sanabria', 'Serrano', 'Teodoro García', 'Timoteo Gordillo', 'Tomas Le Breton',
      'Tte. Benjamin Matienzo', 'Tte. General Frías', 'William C. Morris']

    SEC_ADDR = k ['Piso #', 'Depto. ##', 'Piso # Depto. ##']

    NEIGHBORHOOD = k ['East of Telegraph Road', 'North Norridge', 'Northwest Midlothian/Midlothian Country Club',
      'Mott Haven/Port Morris', 'Kingsbridge Heights', 'Bronxdale', 'Pennypack', 'Bridesburg',
      'Allegheny West', 'Bushwick South', 'Dyker Heights', 'Ocean Parkway South', 'Summerlin North',
      'Seven Hills Area', 'Greater Las Vegas National', 'phoenix', 'Central Chandler', 'South of Bell Road',
      'River Heights', 'White Plains Central', 'Mount Kisco West', 'Pound Ridge East', 'Babylon Bayside',
      'Sagaponack Seaside', 'South of Lake Ave', 'Far Rockaway/Bayswater', 'Jamaica Estates/Holliswood',
      'Murray Hill', 'East Renton', 'Renton West', 'Auburn North', 'Northwoods West', 'Florissant West',
      'Ladue South', 'Candlewood Country Club', 'West Covina East', 'North East Irwindale', 'Sunshine-Gardens',
      'Cipriani', 'Brentwood Central', 'Jupiter South/Abacoa', 'Sea Ranch Lakes', 'Schall Circle/Lakeside Green',
      'Olmsted Falls Central', 'South of Lake Shore Blvd', 'Gates Mills North', 'White Oak South of Columbia Pike',
      'Rockville East of Hungerford Dr', 'Cleveland Park']

    COUNTRY = k ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Anguilla",
      "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", "Austria", "Azerbaijan",
      "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda",
      "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Bouvet Island", "Brazil",
      "British Indian Ocean Territory", "British Virgin Islands", "Brunei",
      "Bulgaria", "Burkina Faso", "Burundi",
      "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic",
      "Chad", "Chile", "China", "Christmas Island", "Cocos Islands", "Colombia", "Comoros",
      "Congo", "Congo", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus",
      "Czech Republic",
      "Denmark", "Djibouti", "Dominica", "Dominican Republic",
      "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia",
      "Faroe Islands", "Falkland Islands", "Fiji", "Finland", "France", "French Guiana",
      "French Polynesia", "French Southern Territories",
      "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Gibraltar", "Greece", "Greenland", "Grenada",
      "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana",
      "Haiti", "Honduras", "Hong Kong", "Hungary",
      "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy",
      "Jamaica", "Japan", "Jersey", "Jordan",
      "Kazakhstan", "Kenya", "Kiribati", "Korea", "Korea", "Kuwait", "Kyrgyz Republic",
      "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia",
      "Libya", "Liechtenstein", "Lithuania", "Luxembourg",
      "Macao", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta",
      "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia", "Moldova",
      "Monaco", "Mongolia", "Montenegro", "Montserrat", "Morocco", "Mozambique", "Myanmar",
      "Namibia", "Nauru", "Nepal", "Netherlands Antilles", "Netherlands", "New Caledonia", "New Zealand",
      "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway",
      "Oman",
      "Pakistan", "Palau", "Palestinian Territory", "Panama", "Papua New Guinea", "Paraguay", "Peru",
      "Philippines", "Pitcairn Islands", "Poland", "Portugal", "Puerto Rico",
      "Qatar",
      "Reunion", "Romania", "Russian Federation", "Rwanda",
      "St. Barthelemy", "St. Helena", "St. Kitts and Nevis", "St. Lucia", "St. Martin",
      "St. Pierre and Miquelon", "St. Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe",
      "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia",
      "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and South Sandwich Islands",
      "Spain", "Sri Lanka", "Sudan", "Suriname", "Svalbard & Jan Mayen Islands", "Swaziland", "Sweden",
      "Switzerland", "Syrian Arab Republic",
      "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Timor-Leste", "Togo", "Tokelau", "Tonga",
      "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Turks and Caicos Islands", "Tuvalu",
      "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States of America",
      "US Minor Outlying Islands", "US Virgin Islands", "Uruguay", "Uzbekistan",
      "Vanuatu", "Venezuela", "Vietnam",
      "Wallis and Futuna", "Western Sahara",
      "Yemen",
      "Zambia", "Zimbabwe"]
  end
end
