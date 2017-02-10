class CreateSpecialUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :special_users do |t|
      t.references :user, foreign_key: true, index: true, null: false
      t.references :related_user, foreign_key: true, references: :users, index: true, null: false
      t.boolean :disguising, null: false
    end
  end
end
