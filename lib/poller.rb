require File.expand_path(File.dirname(__FILE__) + "/../config/environment") unless defined?(RAILS_ROOT)

StatusClassifier.start_service

loop do
  Trend.analyze_all
end

