class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string   :post_number, null: false
      t.integer  :region_id,null: false 
      t.string   :municipalities, null: false
      t.string   :address, null: false
      t.string   :phone_number, null: false
      t.references :order,foreign_key: true,null: false
      t.timestamps
    end
  end
end
