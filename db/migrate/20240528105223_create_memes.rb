class CreateMemes < ActiveRecord::Migration[7.1]
  def change
    create_table :memes do |t|
      t.integer :price
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
