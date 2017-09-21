class AddAuthTokenToMUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :m_users, :auth_token, :string
  end
end
