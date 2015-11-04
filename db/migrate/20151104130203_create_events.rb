class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true, foreign_key: true
      t.string :what
      t.string :when
      t.string :where
      t.float :latitude
      t.float :longitude
      t.integer :needed
      t.integer :joined

      t.timestamps null: false
    end
  end
end
