class Task < ApplicationRecord
  belongs_to :user
  has_many :file_paths
  has_many :comments
  accepts_nested_attributes_for :file_paths, reject_if: :all_blank, allow_destroy: true
  CATEGORIES = %w(Configuration Code ILV)

  def created_at_date
    created_at.strftime("%d %b, %y")
  end

  def created_by?(current_user)
    user_id.eql?(current_user.id) rescue false
  end

  def self.with_category(category)
    if category.blank? || !self::CATEGORIES.include?(category)
      all
    else
      where(category: category)
    end
  end
end
