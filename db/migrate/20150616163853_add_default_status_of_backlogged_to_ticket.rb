class AddDefaultStatusOfBackloggedToTicket < ActiveRecord::Migration
  def change
    change_column :tickets, :status, :text, default: "Backlog"
  end
end
