class AddMUserIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :m_user, foreign_key: true
  end
end
