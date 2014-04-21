class Course < ActiveRecord::Base

  belongs_to :user, foreign_key: :owner_id
  has_many :course_revisions
  
  def is_user_owner?(user)
    if user.nil?
    return false
    end
    self.owner_id == user.id
  end

  def is_user_developer?(user)
    if user.nil?
    return false
    end
    @dev = Developer.where(["user_id =? AND course_id = ?", user.id, self.id]).first
    !@dev.nil?
  end

  def is_user_reviewer?(user)
    if self.review_cycles.nil? or user.nil?
    return false
    end
    @review = Review.where(["user_id = ? AND review_cycle_id = ?", user.id, self.review_cycles.order(:created_at).last.id ]).first
    !@review.nil?
  end

  def soft_delete
    update_attribute(:active, false)
    update_attribute(:deleted_date, Time.now)
    update_attribute(:status, "deleted")
  end
end