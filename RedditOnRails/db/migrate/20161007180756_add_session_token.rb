class AddSessionToken < ActiveRecord::Migration
  def change
    add_column :users, :session_token, :string, presence: true
  end
end
