class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_up_path_for(resource)
    '/'
  end

  def after_sign_out_path_for(resource_or_scope)
    '/'
  end


  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end


  def send_review_link(review, course)
    @review = review
    @course = course
    UserMailer.send_review_link(@review, @course).deliver
  end
  helper_method :send_review_link

  def send_developer_link(developer, course)
    @developer = developer
    @course = course
    UserMailer.send_developer_link(@developer, @course).deliver
  end
  helper_method :send_developer_link

  def send_review_complete_notification(review, developer, course)
    @developer = developer
    @course = course
    @review = review
    UserMailer.send_review_complete( @review, @developer, @course).deliver
  end
  helper_method :send_review_complete_notification

  def flash_message(type, text)
    flash[type] ||= []
    flash[type] << text
  end
  helper_method :flash_message

  def find_or_create_user_from_email(email)
    email = email.strip.downcase

    valid_user = true

    @user = User.find_or_initialize_by(email: email)
    if @user.new_record?
      @user = User.new(email: email, password: Devise.friendly_token[0,20])
      @user.skip_confirmation!
      valid_user = @user.save
      @user.last_sign_in_at = nil
      @user.confirmed_at = nil
      valid_user = @user.save
    end

    return @user
  end
  helper_method :find_or_create_user_from_email

end
