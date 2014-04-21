class User < ActiveRecord::Base

  has_many :courses, foreign_key: :owner_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :uid, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

     def friendly_name
        the_name = self.email
        if !self.name.nil? && !self.name.blank?
            the_name = self.name
        end
        the_name

    end

    def soft_delete
        update_attribute(:active, false)
        update_attribute(:deleted_at, Time.now)
    end

end
