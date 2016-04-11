require 'rails_helper'

RSpec.feature "Requests", type: :feature do
  scenario "show requests" do
    user = create :user
    requests = 5.times.map { create :request  }
    requests.first.comments.create! body: "test"
    2.times.each { requests.last.comments.create! body: "test" }

    visit "/requests"

    within("#new_user") do
      fill_in "Email", with: user.email
      fill_in "Senha", with: user.password
      click_button "Entrar"
    end

    requests.each do |requet|
      expect(page).to have_text(requet.resume)
    end

    expect(page).to have_text("nenhum comentário")
    expect(page).to have_text("1 comentário")
    expect(page).to have_text("2 comentários")
  end
end
