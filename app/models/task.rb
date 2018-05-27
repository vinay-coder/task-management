class Task < ApplicationRecord
  belongs_to :user
  has_many :file_paths
  accepts_nested_attributes_for :file_paths, reject_if: :all_blank, allow_destroy: true

  def created_at_date
    created_at.strftime("%d %b, %y")
  end

  def created_by?(current_user)
    user_id.eql?(current_user.id)
  end
end
