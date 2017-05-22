class AddKindsToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :kind_id, :string
  end
end
