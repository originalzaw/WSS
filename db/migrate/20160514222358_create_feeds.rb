class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|

      t.string :title
      t.string :astronaute
      t.text :body
      t.timestamps null: false
    end
  end
end
