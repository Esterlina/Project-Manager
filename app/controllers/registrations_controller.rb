class RegistrationsController < Devise::RegistrationsController
	before_action :authenticate_user!, :redirect_unless_admin,  only: [:new, :create]
	skip_before_action :require_no_authentication

    def new
    	@types = Type.all
    	build_resource
    	yield resource if block_given?
		respond_with resource
    end

    private
		def sign_up_params
			params.require(:user).permit(:name, :alias,:type_id, :email, :password, :password_confirmation)
		end

		def account_update_params
			params.require(:user).permit(:name, :alias,:type_id, :email, :password, :password_confirmation, :current_password)
		end
		def redirect_unless_admin
			unless current_user.type.user_type == 'Admin'
			  flash[:error] = "SOLO ADMINS"
			  redirect_to root_path
			end
		end
		def sign_up(resource_name, resource)
			true
		end
end