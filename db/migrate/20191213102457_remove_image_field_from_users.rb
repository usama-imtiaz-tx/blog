class RemoveImageFieldFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :image, :binary
  end
end
