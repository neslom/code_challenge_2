require "rails_helper"

RSpec.describe "Change ticket state" do
  let!(:board) { Board.create(title: "first") }
  let!(:ticket) { board.tickets.create(title: "logged") }

  scenario "user can change state of backlogged ticket to current sprint" do
    visit board_path(board)

    within(".backlog") do
      expect(page).to have_content("logged")
    end

    select("Current Sprint", from: "ticket[status]")
    click_link_or_button("Update Ticket")

    visit board_path(board)

    within(".currentSprint") do
      expect(page).to have_content("logged")
    end

    within(".backlog") do
      expect(page).to_not have_content("logged")
    end
  end
end
