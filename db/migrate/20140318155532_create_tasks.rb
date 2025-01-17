class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :complete
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
