configure :development do
  DB = Sequel.connect('postgres://fatpaher@localhost/sinatra_development')
  SECRET_KEY = "bfdcb673d8c48447a37c69643d3a6242d50cb34ae9c3c713b372b6b69a3429d4"
end

configure :test do
  DB = Sequel.connect('postgres://fatpaher@localhost/sinatra_test')
  set :run, false
  set :raise_errors, true
  set :logging, false
  SECRET_KEY = "4b0912fd25102adb08e4efb79b709b8ad4e18352939ad05179b25a8d589d93fd"
end

configure :production do
  DB = Sequel.connect(ENV['DATABASE_URL'])
  SECRET_KEY = [ENV['SECRET_KEY']].pack('H*')
end
