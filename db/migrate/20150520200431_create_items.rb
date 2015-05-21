class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :order_id
      t.string :description
      t.string :name
      t.timestamps null: false
    end
  end
end
