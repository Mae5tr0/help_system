module Users
  class ChangeRoleService
    def initialize(params)
      @user = params[:user]
      @role = params[:role]
    end

    def perform
      begin
        @user.role = @role
      rescue ArgumentError => e
        raise BadRequestError.new(:invalid_params, e.message)
      end
      @user.save!
    end
  end
end
