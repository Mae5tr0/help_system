module Users
  class ChangeRoleService
    def initialize(params)
      @user = params[:user]
      @role = params[:role]
    end

    def perform
      @user.role = @role
      unless @user.valid?
        raise BadRequestError.new(:invalid_params, @user.errors.full_messages)
      end
      @user.save!
    end
  end
end
