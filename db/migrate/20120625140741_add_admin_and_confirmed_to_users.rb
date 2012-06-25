class AddAdminAndConfirmedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :confirmed, :boolean, default: false
  end
end
