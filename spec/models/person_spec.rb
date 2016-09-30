require File.dirname(__FILE__) + '/../spec_helper'

describe Message do
  describe 'validations' do
    it "text can't be empty" do
      message = build(:message, text: '')

      expect(message).not_to be_valid
    end
  end
end
