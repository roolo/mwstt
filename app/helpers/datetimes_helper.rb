module DatetimesHelper
  def print_time_difference(start, stop)
    time_difference_seconds = (stop.to_i - start.to_i)
    [time_difference_seconds / 3600, time_difference_seconds / 60 % 60 ].map{ |t| t.to_s.rjust(2, '0') }.join(':')
  end
end
