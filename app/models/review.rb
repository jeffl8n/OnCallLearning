class Review < ActiveRecord::Base

    belongs_to :course, foreign_key: :course_id
    belongs_to :course_revision, foreign_key: :course_revision_id
    belongs_to :user, foreign_key: :reviewer_id
    has_many :review_comments
end
