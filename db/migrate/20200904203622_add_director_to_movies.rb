class AddDirectorToMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :age
    end

    remove_column :movies, :director, :string
    add_reference :movies, :director, foreign_key:true
  end
end
