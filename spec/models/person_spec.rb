require File.dirname(__FILE__) + '/../spec_helper'

describe Message do
  describe 'validations' do
    it "text can't be empty" do
      message = build(:message, text: '')

      expect(message).not_to be_valid
    end
    it 'create secure link after saving' do
      message = build(:message, link: nil)
      message.save
      expect(message.link).not_to eq(nil)
    end
  end
  describe 'encryption of text field' do
    it 'save text field as encrypted' do
      text = 'Secret text'
      message = create(:message, text: text)
      expect(message.encrypted_text).not_to eq(text)
    end
  end
end
