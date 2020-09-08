class CreateUserArts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_arts do |t|
      t.references :art, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :blurb

      t.timestamps
    end
  end
end
