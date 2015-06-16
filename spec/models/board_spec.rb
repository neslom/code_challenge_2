require 'rails_helper'

RSpec.describe Board, type: :model do
  context "is invalid" do
    it "without a title" do
      board = Board.new(title: "")

      expect(board).to be_invalid
    end
  end

  describe "#backlogged_tickets" do
    let!(:board) { Board.create(title: "board") }

    it "returns a collection of the board's backlogged tickets" do
      board.tickets.create(title: "yolo ticket")

      expect(board.backlogged_tickets.first.title).to eq("yolo ticket")
    end
  end

  describe "#current_sprint_tickets" do
    let!(:board) { Board.create(title: "board") }

    it "returns a collection of the board's current sprint tickets" do
      board.tickets.create(title: "yolo ticket", status: "Current Sprint")

      expect(board.current_sprint_tickets.first.title).to eq("yolo ticket")
    end
  end

  describe "#in_progress_tickets" do
    let!(:board) { Board.create(title: "board") }

    it "returns a collection of the board's backlogged tickets" do
      board.tickets.create(title: "yolo ticket", status: "In Progress")

      expect(board.in_progress_tickets.first.title).to eq("yolo ticket")
    end
  end

  describe "#done_tickets" do
    let!(:board) { Board.create(title: "board") }

    it "returns a collection of the board's backlogged tickets" do
      board.tickets.create(title: "yolo ticket", status: "Done")

      expect(board.done_tickets.first.title).to eq("yolo ticket")
    end
  end
end
