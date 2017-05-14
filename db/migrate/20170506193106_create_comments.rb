class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :post, foreign_key: true
      t.string :body
      t.integer :post_id

      t.timestamps
    end
  end
end
