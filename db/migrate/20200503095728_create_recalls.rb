class CreateRecalls < ActiveRecord::Migration[6.0]
  def change
    create_table :recalls do |t|
      t.references :material, null: false, foreign_key: true
      t.references :previous_recall, null: true
      t.timestamp :started_at
      t.timestamp :material_shown_at
      t.timestamp :finished_at
      t.float :recall_coverage

      t.timestamps
    end
  end
end
