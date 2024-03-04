class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.strings :comment

      t.timestamps
    end
  end
end
