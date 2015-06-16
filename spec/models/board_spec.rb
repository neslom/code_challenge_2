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
end
