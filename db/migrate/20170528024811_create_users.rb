class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, id: false do |t|
      t.primary_key :id, :string
      t.string :oauth_token

      t.string :name
      t.string :email
      t.string :avatar
      t.integer :lock_version

      t.timestamps
    end
  end
end
