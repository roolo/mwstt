class Datetime < ActiveRecord::Base
  def self.getNewDatetime
    new_datetime = self.new
    new_datetime.start = DateTime.now
    new_datetime.stop = nil
    new_datetime.save
    
    return new_datetime
  end
end
