class AddSomeStringToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :writer, :string
    add_column :messages, :keyword, :string
  end
end
