class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :url, index: { unique: true }, null: false
      t.integer :state, null: false
      t.datetime :recall_after
      t.timestamps
    end
  end
end
