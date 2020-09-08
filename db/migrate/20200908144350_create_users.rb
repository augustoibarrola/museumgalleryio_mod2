class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :bio
      t.string :profile_picture
      t.string :password_digest

      t.timestamps
    end
  end
end
