require 'spec_helper'

describe 'create student', type: :feature do
  it 'creates student' do
    visit '/students/new'

    fill_in "Name", with: "Diego"
    fill_in "Register number", with: "123456789"
    fill_in "Status", with: 0

    click_on "Create Student"
  end
end
