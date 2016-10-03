require File.dirname(__FILE__) + '/../spec_helper'

describe 'message will destroy', feature: true do
  context "if 'after hour' selected" do
    it 'will be not avaliable if one hour pass' do
      message = create(:message, :delete_after_hour, created_at: 2.hours.ago)
      visit "/#{message.link}"

      expect(page.status_code).to eq(404)
    end

    it "will be avaliable if one hour did't pass" do
      message = create(:message, :delete_after_hour, created_at: 30.minutes.ago)
      visit "/#{message.link}"

      expect(page).to  have_content(message.text)
    end
  end

  context "if 'after first visit' selected" do
  end
end
