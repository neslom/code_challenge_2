class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.text :title

      t.timestamps null: false
    end
  end
end
