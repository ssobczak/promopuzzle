class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.integer :position
      t.references :image, index: true

      t.timestamps
    end
  end
end
