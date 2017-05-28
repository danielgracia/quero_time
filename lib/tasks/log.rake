task :log_sql => :environment do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end
