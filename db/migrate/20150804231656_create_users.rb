class CreateUsers < ActiveRecord::Migration
  
  def change
    create_table :users do |t|
      t.references :todo_items, index: true
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
