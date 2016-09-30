RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    FactoryGirl.definition_file_paths = %w{./spec/factories}
    FactoryGirl.find_definitions
  end
end
