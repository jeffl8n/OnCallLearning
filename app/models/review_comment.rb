class ReviewComment < ActiveRecord::Base

    belongs_to :review, foreign_key: :review_id
    belongs_to :review_comment_status, foreign_key: :status
    has_one :user, through: :review
    belongs_to :assignee, class_name: "User", foreign_key: :assigned_to_id
    has_many :review_comment_discussion

    def as_json(options = nil)
        {
            :id => id,
            :review_id => review_id,
            :review_cycle_id => review_cycle_id,
            :slide => slide,
            :title => title,
            :body => body,
            :star => star,
        }
    end
end
