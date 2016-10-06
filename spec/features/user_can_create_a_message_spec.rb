require File.dirname(__FILE__) + '/../spec_helper'

describe 'user visit a root page', feature: true do
  it 'can write a message and can have link to read it' do
    message = 'Very secret message'
    visit '/'
    fill_in('Message', with: message)
    click_on 'Save'
    find('.message_link').click
    expect(page).to have_content(message)
  end
end
