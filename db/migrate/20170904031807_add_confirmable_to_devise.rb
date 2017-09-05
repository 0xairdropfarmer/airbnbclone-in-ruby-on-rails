class AddConfirmableToDevise < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :date_time
    add_column :users, :confirmation_sent_at, :date_time
    add_index :users, :confirmation_token, unique: true
  end
end
