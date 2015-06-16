class Ticket < ActiveRecord::Base
  belongs_to :board

  validates :title, presence: true
end
