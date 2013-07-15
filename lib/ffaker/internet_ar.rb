module Faker
  module InternetAR
    extend ModuleUtils
    extend self

    def email(name = nil)
      [ user_name(name), domain_name ].join('@')
    end

    # returns an email address of an online disposable email service (like tempinbox.com).
    # you can really send an email to these addresses an access it by going to the service web pages.
    def disposable_email(name = nil)
      [ user_name(name), DISPOSABLE_HOSTS.sample ].join('@')
    end

    def free_email(name = nil)
      "#{user_name(name)}@#{HOSTS.sample}"
    end

    def user_name(name = nil)
      if name
        parts = ArrayUtils.shuffle(name.scan(/\w+/)).join(ArrayUtils.rand(%w(. _)))
        parts.downcase!
        parts
      else
        case rand(2)
        when 0
          NameAR.first_name.gsub(/\W/, '').downcase
        when 1
          parts = [ NameAR.first_name, NameAR.last_name ].each {|n| n.gsub!(/\W/, '') }
          parts = parts.join ArrayUtils.rand(%w(. _))
          parts.downcase!
          parts
        end
      end
    end

    def domain_name
      case rand(8)
      when 0
        "#{domain_word}.#{domain_suffix}"
      else
        HOSTS.sample
      end
    end

    def domain_word
      result = [ NameAR.first_name, NameAR.last_name ].each {|n| n.gsub!(/\W/, '') }
      result = result.join ArrayUtils.rand(%w(. _))
      result.downcase!
      result
    end

    def domain_suffix
      DOMAIN_SUFFIXES.sample
    end

    def uri(protocol)
      "#{protocol}://#{domain_name}"
    end

    def http_url
      uri("http")
    end

    def ip_v4_address
      (1..4).map { BYTE.random_pick(1) }.join(".")
    end

    BYTE = k((0..255).to_a.map { |n| n.to_s })
    HOSTS = k %w(gmail.com.ar yahoo.com.ar hotmail.com.ar speedy.com.ar fibertel.com.ar)
    DISPOSABLE_HOSTS = k %w(mailinator.com suremail.info spamherelots.com binkmail.com safetymail.info)
    DOMAIN_SUFFIXES = k %w(com com.ar org.ar gov.ar)
  end
end
