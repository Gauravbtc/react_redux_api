class AddCofirmableFiledsToMUser < ActiveRecord::Migration[5.1]
  def change
    add_column :m_users, :confirmation_token, :string
    add_column :m_users, :confirmed_at, :date
    add_column :m_users, :confirmation_sent_at, :date
    add_column :m_users, :unconfirmed_email, :string
  end
end
