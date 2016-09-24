module Api
  module V1
    class ResourceController < Api::BaseController
      before_action :authorize_user

      def index
        # authorize! :index, :users

        render json: paginate(resource_class.for(current_user))
      end

      def show
        # authorize! :show, resource

        render json: resource
      end

      def create
        # authorize! :create, :ticket

        head :no_content
      end


      def update
        # authorize! :update, resource

        head :no_content
      end

      def resource_class
        fail NotImplementedError
      end

      def resource
        fail NotImplementedError
      end

      def resource_params
        fail NotImplementedError
      end
    end
  end
end
