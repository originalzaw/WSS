class CreateFeedComments < ActiveRecord::Migration
  def change
    create_table :feed_comments do |t|
      t.string :author
      t.text :body
      t.references :feed
      t.timestamps null: false
    end
  end
end
