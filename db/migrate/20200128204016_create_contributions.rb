class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.string :title
      t.string :author
      t.string :section
      t.string :category
      t.string :comment
      t.string :status
      t.string :product_id

      t.timestamps
    end
  end
end
