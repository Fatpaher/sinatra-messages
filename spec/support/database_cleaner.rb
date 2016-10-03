RSpec.configure do |c|
  c.before :suite do
    DatabaseCleaner[:sequel, { connection: ::DB }].strategy = :transaction
    DatabaseCleaner[:sequel, { connection: ::DB }].clean_with(:truncation)
  end
  c.before feature: true do
    DatabaseCleaner[:sequel, { connection: ::DB }].start
  end
  c.after feature: true do
    DatabaseCleaner[:sequel, { connection: ::DB }].clean
  end
end
