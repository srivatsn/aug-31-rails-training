class CreateProducers < ActiveRecord::Migration[6.0]
  def change
    create_table :producers do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end

    add_reference :movies, :producer, foreign_key:true
  end
end
