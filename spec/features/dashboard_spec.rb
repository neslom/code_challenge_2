require "rails_helper"

RSpec.describe "Dashboard" do
  scenario "user visits main page and sees a button to create a new board" do
    visit root_path

    click_link_or_button("Create New Board")
    expect(current_path).to eq(new_board_path)
  end
end
