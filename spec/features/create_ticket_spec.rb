require "rails_helper"

RSpec.describe "Ticket Creation" do
  let!(:board) { Board.create(title: "WaterBoard") }

  scenario "user creates backlogged ticket for a board" do
    visit board_path(board)

    expect(page).to have_content("WaterBoard")
    click_link_or_button("Create Ticket")

    expect(current_path).to eq(new_ticket_path)

    fill_in("ticket[title]", with: "ticket title")
    fill_in("ticket[description]", with: "ticket description")
    click_link_or_button("Create Ticket")

    expect(current_path).to eq(board_path(board))
    expect(Ticket.first.board).to eq(board)

    within(".backlog") do
      expect(page).to have_content(Ticket.first.title)
    end
  end

  scenario "user creates current_sprint ticket for a board" do
    board2 = Board.create(title: "yolo")

    visit board_path(board2)

    expect(page).to have_content("yolo")
    click_link_or_button("Create Ticket")

    expect(current_path).to eq(new_ticket_path)

    fill_in("ticket[title]", with: "ticket title")
    fill_in("ticket[description]", with: "ticket description")
    select("Current Sprint", from: "ticket[status]")
    click_link_or_button("Create Ticket")

    expect(current_path).to eq(board_path(board2))
    expect(Ticket.first.board).to eq(board2)

    within(".currentSprint") do
      expect(page).to have_content(Ticket.first.title)
    end
  end
end
