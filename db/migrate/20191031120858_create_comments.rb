class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :signature
      t.text :content
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.timestamps
    end
  end
end
