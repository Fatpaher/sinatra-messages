configure :prodoction do
  set :database, 'sqlite://tmp/sinatra_development.sqlite'
end

configure :test do
  set :database, 'sqlite://tmp/sinatra_test.sqlite'
  set :environment, :test
  set :run, false
  set :raise_errors, true
  set :logging, false
end

configure :prodoction do
  Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/sinatra')
end
