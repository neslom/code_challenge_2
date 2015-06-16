require "rails_helper"

RSpec.describe "Dashboard" do
  scenario "user visits main page and can create a new board" do
    visit root_path

    click_link_or_button("Create New Board")

    expect(current_path).to eq(new_board_path)

    fill_in("board[title]", with: "Code Retreat")

    expect do
      click_link_or_button("Create Board")
    end.to change { Board.count }.from(0).to(1)

    expect(current_path).to eq(board_path(Board.first))
    expect(page).to have_content("Code Retreat")
  end

  scenario "user sees collection of existing boards" do
    ["hello", "what", "okay"].each do |word|
      Board.create(title: word)
    end

    visit root_path

    ["hello", "what", "okay"].each do |word|
      expect(page).to have_link(word)
    end

    click_link_or_button("hello")

    expect(current_path).to eq(board_path(Board.find_by(title: "hello")))
  end
end
