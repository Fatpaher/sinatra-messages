configure :development do
  set :database, 'sqlite://tmp/sinatra_development.db'
end

configure :test do
  set :database, 'sqlite://tmp/sinatra_test.db'
  set :run, false
  set :raise_errors, true
  set :logging, false
end

configure :prodoction do
  Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/sinatra')
end
