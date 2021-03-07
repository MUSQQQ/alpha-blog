class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.int :user_id
      t.timestamps
    end
  end
end
