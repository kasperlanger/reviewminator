class Recall < ApplicationRecord
  belongs_to :material
  belongs_to :previous_recall, class_name: 'Recall', optional: true
end
