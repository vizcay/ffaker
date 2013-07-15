# encoding: utf-8
# => author: Pablo Vizcay github.com/vizcay

module  Faker
  module PhoneNumberAR
    extend ModuleUtils
    extend self

    def home_work_phone_number
      Faker.numerify("4##-#####")
    end

    def mobile_phone_number
      Faker.numerify("15#-#######")
    end

    def phone_number
      case rand(2)
      when 0 then home_work_phone_number
      when 1 then mobile_phone_number
      end
    end

    def country_code
      "54"
    end

    def international_home_work_phone_number
      Faker.numerify("#{country_code}11#{home_work_phone_number}")
    end

    def international_mobile_phone_number
      Faker.numerify("#{country_code}11#{mobile_phone_number}")
    end

    def international_phone_number
      case rand(2)
      when 0 then international_mobile_phone_number
      when 1 then international_home_work_phone_number
      end
    end

    def toll_free_number
      Faker.numerify("0800-###-####")
    end
  end
end
