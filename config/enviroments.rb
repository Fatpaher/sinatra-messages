configure :development do
  DB = Sequel.connect('postgres://fatpaher@localhost/sinatra_development')
  SECRET_KEY = SecureRandom.random_bytes(32)
end

configure :test do
  DB = Sequel.connect('postgres://fatpaher@localhost/sinatra_test')
  set :run, false
  set :raise_errors, true
  set :logging, false
  SECRET_KEY = SecureRandom.random_bytes(32)
end

configure :prodoction do
  Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/sinatra')
  SECRET_KEY = ENV('SECRET_KEY')
end
