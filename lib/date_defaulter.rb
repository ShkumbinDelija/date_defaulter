require 'date'

module DateDefaulter
  @@config = {}

  class Configuration
    @@instance = Configuration.new

    attr_accessor :format

    private_class_method :new

    def self.instance
      @@instance
    end
  end

  def self.configuration
    Configuration.instance.tap do |configuration|
      yield configuration if block_given?
    end
  end
end

class Date
  alias_method :date_defaulter_strftime, :strftime
  alias_method :date_defaulter_to_s, :to_s

  def to_s
    if DateDefaulter.configuration.format.nil?
      date_defaulter_to_s
    else
      strftime(DateDefaulter.configuration.format)
    end
  end

  def strftime(*args)
    return date_defaulter_strftime(*args) if args.any?

    if DateDefaulter.configuration.format.nil?
      date_defaulter_strftime
    else
      date_defaulter_strftime(DateDefaulter.configuration.format)
    end
  end
end
