require File.expand_path(File.dirname(__FILE__) + "/../config/environment") unless defined?(RAILS_ROOT)


loop do
  begin
    Trend.analyze_all
    sleep 1
  rescue 
    sleep 2
  end
end

