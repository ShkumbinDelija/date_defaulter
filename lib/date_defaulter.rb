require 'date'

class Date
  def to_s
    strftime('%d/%m/%y')
  end
end
