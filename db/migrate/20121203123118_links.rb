class Links < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.integer :id
      t.integer :user_id, null: true
      t.string :slug, null: false
      t.string :url, null: false, limit: 255
      t.datetime :created_at
    end
    add_index :links, :id
    add_index :links, :slug
  end

  def self.down
    drop_table :links
  end
end
