class AddUsersIdToArticles < ActiveRecord::Migration[6.1]
  def change  #migration file made in powershell, used to add user_id column to articles table
    add_column :articles, :user_id, :int
  end
end
