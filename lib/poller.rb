require File.expand_path(File.dirname(__FILE__) + "/../config/environment") unless defined?(RAILS_ROOT)

StatusClassifier.start_service
#DRb.thread.join

loop do
  Trend.analyze_current
  sleep 5
end

