class CreateFilePaths < ActiveRecord::Migration[5.1]
  def change
    create_table :file_paths do |t|
      t.string :name
      t.text :description
      t.integer :task_id

      t.timestamps
    end
  end
end
