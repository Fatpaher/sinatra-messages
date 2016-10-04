require File.dirname(__FILE__) + '/../spec_helper'

describe Message do
  describe 'validations' do
    it "text can't be empty" do
      message = build(:message, text: '')

      expect(message).not_to be_valid
    end

    it 'option_value cannot be negative' do
      message = build(:message, option_value: -2)
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

  describe 'option_value' do
    it 'will set to 1 if not defined' do
      message = build(:message, option_value: nil)

      message.save
      expect(message.option_value).to eq(1)
    end

    it 'will save if defiend' do
      message = build(:message, option_value: 3)

      message.save
      expect(message.option_value).to eq(3)
    end
  end
end
