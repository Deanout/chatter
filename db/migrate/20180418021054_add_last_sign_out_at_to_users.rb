class AddLastSignOutAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_sign_out_at, :datetime
  end
end
