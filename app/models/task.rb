class Task < ApplicationRecord
  has_many :file_paths
  accepts_nested_attributes_for :file_paths, reject_if: :all_blank, allow_destroy: true
end
