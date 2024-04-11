class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.integer :rolls, array: true, default: []
      t.string :status

      t.timestamps
    end
  end
end
