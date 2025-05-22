class CreateVisits < ActiveRecord::Migration[8.0]
  def change
    create_table :visits do |t|
      t.string :page
      t.integer :count

      t.timestamps
    end
  end
end
