require File.dirname(__FILE__) + '/../spec_helper'

describe 'user visit a root page', feature: true do
  it 'can write a message and can have link to read it' do
    message = 'Very secret message'
    visit '/'
    find('.message_form').set(message)
    click_on 'Save'
    find('.message_link').click
    expect(page).to have_content(message)
  end
  it 'redirects to message page and see error' do
    visit '/'
    click_on 'Save'
    expect(page).to have_content('error')
  end
end

