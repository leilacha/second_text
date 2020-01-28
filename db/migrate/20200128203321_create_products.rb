class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.string :author
      t.date :release_date
      t.text :description

      t.timestamps
    end
  end
end
