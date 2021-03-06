class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.text :categories, array: true, default: []
      t.string :status

      t.timestamps
    end
  end
end
