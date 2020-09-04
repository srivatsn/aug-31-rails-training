class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :casts do |t|
      t.references :actor, index: true, foreign_key: true
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
