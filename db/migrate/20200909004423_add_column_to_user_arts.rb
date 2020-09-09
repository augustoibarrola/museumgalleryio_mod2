class AddColumnToUserArts < ActiveRecord::Migration[6.0]
  def change
    add_column :user_arts, :image, :string
  end
end
