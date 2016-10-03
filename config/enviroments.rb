configure :development do
  set :database, 'postgres://fatpaher@localhost/sinatra_development'
end

configure :test do
  set :database, 'postgres://fatpaher@localhost/sinatra_test'
  set :run, false
  set :raise_errors, true
  set :logging, false
end

configure :prodoction do
  Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/sinatra')
end
