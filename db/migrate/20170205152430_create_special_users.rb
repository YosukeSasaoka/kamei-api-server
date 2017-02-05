class CreateSpecialUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :special_users do |t|
      t.references :user, index: true, null: false
      t.references :related_user, references: :users, index: true, null: false
      t.boolean :disguising, null: false
    end
  end
end
