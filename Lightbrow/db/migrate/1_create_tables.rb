class CreateTables < ActiveRecord::Migration
  def up
    create_table :histories do |t|
      t.string :url
      t.string :page_name, limit: 1000
      t.timestamps null: true
    end
  end

  def down
    drop_table :histories
  end
end
