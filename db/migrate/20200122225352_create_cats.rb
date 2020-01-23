class CreateCats < ActiveRecord::Migration[6.0]
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :city
      t.text :bio

      t.timestamps
    end
  end
end
