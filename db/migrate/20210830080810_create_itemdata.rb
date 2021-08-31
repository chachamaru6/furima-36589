class CreateItemdata < ActiveRecord::Migration[6.0]
  def change
    create_table :itemdata do |t|

      t.timestamps
    end
  end
end
