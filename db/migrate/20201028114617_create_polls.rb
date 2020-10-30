class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.string :question
      t.integer :yes
      t.integer :no, default: 0
      t.integer :unsure, default: 0
    end
  end
end
