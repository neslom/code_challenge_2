class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.text :title
      t.text :description
      t.text :status

      t.timestamps null: false
    end
  end
end
