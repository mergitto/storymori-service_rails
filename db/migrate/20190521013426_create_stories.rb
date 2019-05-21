class CreateStories < ActiveRecord::Migration[5.2]
  def change
    create_table :stories do |t|
      t.string :title
      t.string :summary

      t.integer :created_by # user_idが入る
      t.integer :updated_by # user_idが入る
      t.timestamps
    end
    # 外部キー制約を追加
    add_foreign_key :stories, :user, column: :created_by
    add_foreign_key :stories, :user, column: :updated_by
  end
end
