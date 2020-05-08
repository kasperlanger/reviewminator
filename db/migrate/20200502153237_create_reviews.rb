class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.references :material, null: false, foreign_key: true
      t.datetime :finished_at
      t.integer :cause_of_review
      t.timestamps
    end
  end
end
