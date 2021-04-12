class CreateSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :snacks do |t|
      t.string :label
      t.float :price

      t.timestamps
    end
  end
end
