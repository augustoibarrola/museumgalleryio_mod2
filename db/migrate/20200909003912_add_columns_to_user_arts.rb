class AddColumnsToUserArts < ActiveRecord::Migration[6.0]
  def change
    add_column :user_arts, :title, :string
    add_column :user_arts, :url_link, :string
  end
end
