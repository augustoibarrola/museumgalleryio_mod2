class CreateMuseums < ActiveRecord::Migration[6.0]
  def change
    create_table :museums do |t|
      t.string :name
      t.string :address
      t.text :bio
      t.string :website

      t.timestamps
    end
  end
end
