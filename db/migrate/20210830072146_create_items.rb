class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :category, null: false
      t.integer :status, null: false
      t.integer :load, null: false
      t.integer :prefecture, null: false
      t.integer :date, null: false
      t.integer :price, null: false


      t.timestamps
    end
  end
end
