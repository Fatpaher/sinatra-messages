require File.dirname(__FILE__) + '/spec_helper'

describe "App" do
  include Rack::Test::Methods

  it "should respond to /" do
    get '/'
    expect(last_response).to be_ok
  end
end
