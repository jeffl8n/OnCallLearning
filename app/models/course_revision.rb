class CourseRevision < ActiveRecord::Base
  
    belongs_to :course, foreign_key: :course_id
    has_many :reviews
      
    has_attached_file :course_upload, 
      :storage => :s3,
                  :s3_credentials => "#{Rails.root}/config/aws.yml",
                  :path => "courses/:course_id/revision/:course_revision_num",
                  :url => ':s3_domain_url'

end