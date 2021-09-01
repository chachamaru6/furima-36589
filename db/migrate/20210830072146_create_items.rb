class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name, null: false
      t.text :explanation, null: false
      t.integer :category_id, null: false
      t.integer :status_id, null: false
      t.integer :load_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :schedule_id, null: false
      t.integer :price, null: false


      t.timestamps
    end
  end
end
