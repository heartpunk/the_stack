class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.text :text
      # t.reference :list TODO Doesn't work, yet, we'd like to fix this in the next version.
      t.integer :list_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
