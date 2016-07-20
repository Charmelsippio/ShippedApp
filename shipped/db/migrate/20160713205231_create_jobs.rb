class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.integer :cost
      t.string :description
      t.string :origin
      t.string :destination

      t.timestamps null: false
    end
  end
end
