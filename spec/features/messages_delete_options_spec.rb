require File.dirname(__FILE__) + '/../spec_helper'

describe 'messege delete options', js: true, feature: true do
  context "delete 'after visit' option choose" do
    it "can fill form and see the message 'number_of_visits' times" do
      text = 'Some message'
      number_of_visits = 3

      visit '/'
      fill_in('Message', with: text)
      choose('Delete after visit')
      fill_in('Number of visits', with: number_of_visits)
      click_on 'Save'
      link = find('.message_link')[:href]

      number_of_visits.times do
        visit link
        expect(page).to have_content(text)
      end

      visit link
      expect(page.status_code).to eq(404)
    end
  end

  context 'delete after hours option choose' do
    it "can fill form and see message for 'hours' value" do
      text = 'Some message'
      hours = 3

      visit '/'
      fill_in('Message', with: text)
      choose('Delete after hour')
      fill_in('Number of hours', with: hours)
      click_on 'Save'
      link = find('.message_link')[:href]

      Timecop.freeze(Time.current + 2.hours) do
        visit link
        expect(page).to have_content(text)
      end

      Timecop.freeze(Time.current + 4.hours) do
        visit link
        expect(page.status_code).to eq(404)
      end
    end
  end
end
