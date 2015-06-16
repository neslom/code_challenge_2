require "rails_helper"

RSpec.describe "Ticket Creation" do
  let!(:board) { Board.create(title: "WaterBoard") }

  scenario "user creates ticket for a board" do
    visit board_path(board)

    expect(page).to have_content("WaterBoard")
    click_link_or_button("Create Ticket")

    expect(current_path).to eq(new_ticket_path)

    fill_in("ticket[title]", with: "ticket title")
    fill_in("ticket[description]", with: "ticket description")
    click_link_or_button("Create Ticket")

    expect(current_path).to eq(board_path(board))

    expect(Ticket.first.board).to eq(board)
  end
end
