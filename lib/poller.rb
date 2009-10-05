require File.expand_path(File.dirname(__FILE__) + "/../config/environment") unless defined?(RAILS_ROOT)

loop do
  Trend.analyze_current
  sleep 5
end

