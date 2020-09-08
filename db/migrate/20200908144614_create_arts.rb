class CreateArts < ActiveRecord::Migration[6.0]
  def change
    create_table :arts do |t|
      t.string :title
      t.date :date
      t.string :medium
      t.string :object
      t.string :image
      t.belongs_to :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
