require 'date'

class Date
  def to_s
    strftime('%d/%m/%Y')
  end
end
