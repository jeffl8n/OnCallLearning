class RegistrationsController < Devise::RegistrationsController

    def edit
        @user = current_user

    end

    def update
        @user = User.find(current_user.id)

        successfully_updated = if needs_password?(@user, params)
            @user.update_with_password(params[:user])
        else
            # remove the virtual current_password attribute
            # update_without_password doesn't know how to ignore it
            params[:user].delete(:current_password)

            @user.update_without_password(params[:user])
        end

        if successfully_updated

            UserMailer.customer_updated(@user).deliver
            set_flash_message :notice, :updated
            # Sign in the user bypassing validation in case his password changed
            sign_in @user, :bypass => true
            redirect_to after_update_path_for(@user)
        else
            render "edit"
        end
    end

    def destroy
        resource.soft_delete
        Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
        set_flash_message :notice, :destroyed if is_navigational_format?
        respond_with_navigational(resource) { redirect_to after_sign_out_path_for(resource_name)}
    end

    protected
    def after_update_path_for(resource)
        edit_user_registration_path
    end

    private
    # check if we need password to update user data
    # ie if password was changed
    # extend this as needed
    def needs_password?(user, params)
        !params[:user][:password].nil? and !params[:user][:password].empty?
    end
end
