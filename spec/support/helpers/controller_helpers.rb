module ControllerHelpers
  # Helper to stub user authentication.
  # It must be used on every controller which requires token authorization.
  # Authorization itself must be tested in different place.
  #
  #   @example
  #
  #     it 'should be authorized' do
  #       login
  #       get :index
  #     end
  def login(user = build(:user))
    allow(controller).to receive(:current_user).and_return(user)
  end

  #Return parsed json response
  def json
    @json ||= JSON.parse(response.body, symbolize_names: true)
  end
end
