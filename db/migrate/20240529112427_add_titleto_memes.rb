class AddTitletoMemes < ActiveRecord::Migration[7.1]
  def change
    add_column :memes, :title, :string
  end
end
