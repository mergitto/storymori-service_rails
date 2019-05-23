class InitialCreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name, null: false

      t.integer :created_by # user_idが入る
      t.integer :updated_by # user_idが入る
      t.timestamps
    end

    create_table :pages do |t|
      t.string :name
      t.string :text
      t.integer :story_id, null: false
      t.integer :parent_id # 同じstory_idで、最新のpage_idを入れる

      t.integer :created_by # user_idが入る
      t.integer :updated_by # user_idが入る
      t.timestamps
    end
    add_index :pages, :story_id

    create_table :stories do |t|
      t.string :title
      t.string :summary

      t.integer :created_by # user_idが入る
      t.integer :updated_by # user_idが入る
      t.timestamps
    end
  end
end
