class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :room, foreign_key: true
      t.references :user, foreign_key: true
      t.text :content
      t.string :imageurl

      t.timestamps
    end
  end
end
