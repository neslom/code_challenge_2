require 'rails_helper'

RSpec.describe Board, type: :model do
  context "is invalid" do
    it "without a title" do
      board = Board.new(title: "")

      expect(board).to be_invalid
    end
  end
end
