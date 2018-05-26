class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :category
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
