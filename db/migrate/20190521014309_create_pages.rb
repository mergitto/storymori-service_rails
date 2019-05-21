class CreatePages < ActiveRecord::Migration[5.2]
  def change
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
    # 外部キー制約を追加
    add_foreign_key :pages, :user, column: :created_by
    add_foreign_key :pages, :user, column: :updated_by
  end
end
