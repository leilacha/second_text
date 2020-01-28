class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name
      t.array :categories
      t.string :status

      t.timestamps
    end
  end
end
