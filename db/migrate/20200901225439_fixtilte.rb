class Fixtilte < ActiveRecord::Migration[6.0]
  def change
    rename_column :movies, :tilte, :title
  end
end
