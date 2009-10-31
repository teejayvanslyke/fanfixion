require File.expand_path(File.dirname(__FILE__) + "/../config/environment") unless defined?(RAILS_ROOT)


loop do
  begin
    Trend.analyze(:hottest, 10)
    sleep 1
  rescue Exception => e
    puts e.inspect
    sleep 2
  end
end

