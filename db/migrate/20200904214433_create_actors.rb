class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.integer :age
      t.boolean :oscar_nominee, default:false

      t.timestamps
    end
  end
end
