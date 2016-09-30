configure :prodoction do
  set :database, 'sqlite://tmp/sinatra_development.sqlite'
end

configure :test do
  set :database, 'sqlite://tmp/sinatra_test.sqlite'
end

configure :prodoction do
  Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/sinatra')
end
