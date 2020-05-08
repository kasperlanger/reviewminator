class Review < ApplicationRecord
  belongs_to :material
  enum :cause_of_review [ :new_material, :blackout, :material_changed ]
end
