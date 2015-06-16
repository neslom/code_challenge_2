class Board < ActiveRecord::Base
  validates :title, presence: true

  has_many :tickets

  def backlogged_tickets
    tickets.where(status: "Backlog")
  end

  def current_sprint_tickets
    tickets.where(status: "Current Sprint")
  end

  def in_progress_tickets
    tickets.where(status: "In Progress")
  end

  def done_tickets
    tickets.where(status: "Done")
  end
end
