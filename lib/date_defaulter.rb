require 'date'

module DateDefaulter
  class Configuration
    @@instance = Configuration.new

    attr_accessor :format

    private_class_method :new

    def self.instance
      @@instance
    end
  end

  module_function

  def configuration
    Configuration.instance.tap do |configuration|
      yield configuration if block_given?
    end
  end

  def format
    configuration.format
  end

  def format=(format)
    configuration.format = format
  end
end

class Date
  alias_method :date_defaulter_strftime, :strftime
  alias_method :date_defaulter_to_s, :to_s

  def to_s
    if DateDefaulter.format.nil?
      date_defaulter_to_s
    else
      strftime(DateDefaulter.format)
    end
  end

  def strftime(*args)
    return date_defaulter_strftime(*args) if args.any?

    if DateDefaulter.format.nil?
      date_defaulter_strftime
    else
      date_defaulter_strftime(DateDefaulter.format)
    end
  end
end
