class ChangeBack < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :password, :string
  end
end
