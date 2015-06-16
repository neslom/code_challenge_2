require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context "is invalid" do
    it "without a title" do
      ticket = Ticket.new(title: "")
      expect(ticket).to be_invalid
    end
  end
end
