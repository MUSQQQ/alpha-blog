class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change  #adding password column
    add_column :users, :password_digest, :string  #password isnt just hashed, every password is first combined with a random string (salt) and then hashed
  end
end
