class Board < ActiveRecord::Base
  validates :title, presence: true

  has_many :tickets

  def backlogged_tickets
    tickets.where(status: "Backlog")
  end
end
