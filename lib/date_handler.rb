require 'date'
module Date
  class Handler
    def self.format(date)
      year  = date[0..3]to_i
      month = date[5..6]to_i
      day   = date[8..9]to_i
      Date.new(year,month,day)
    end
  end
end