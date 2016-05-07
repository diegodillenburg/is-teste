require 'spec_helper'

describe 'create student', type: :feature do
  it 'creates student' do
    visit '/students/new'

    fill_in "Nome", with: "Diego"
    fill_in "Número de matrícula", with: "123456789"
    choose("student[status]", match: :first)

    click_on "Criar"
  end
end
