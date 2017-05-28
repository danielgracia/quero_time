class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.string :state
      t.belongs_to :user, type: :string, index: true, foreign_key: true
      t.belongs_to :team, index: true, foreign_key: true

      t.timestamps
    end
  end
end
