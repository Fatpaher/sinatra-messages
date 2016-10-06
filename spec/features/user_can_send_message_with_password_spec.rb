require File.dirname(__FILE__) + '/../spec_helper'

describe 'user can create message with password', feature: true, js: true do
  it 'enter correct password' do
    text = 'Some message'
    password = 'very_secret_password'

    visit '/'
    fill_in('Message', with: text)
    check('With password')
    fill_in('Password', with: password)
    click_on 'Save'
    find('.message_link').click
    fill_in('Password', with: password)
    click_on 'Submit'
    expect(page).to have_content(text)
  end

  it 'enter wrong password' do
    text = 'Some message'
    password = 'very_secret_password'
    wrong_password = 'oops_its_wrong'

    visit '/'
    fill_in('Message', with: text)
    check('With password')
    fill_in('Password', with: password)
    click_on 'Save'
    find('.message_link').click
    fill_in('Password', with: wrong_password)
    expect(page).not_to have_content(text)
  end
end
