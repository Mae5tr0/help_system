module ControllerHelpers
  # Helper to stub and ensure ability on controller.
  # It must be used on every controller under the CanCan to prevent checking real abilities.
  # Abilities should be tested with unit tests.
  #
  #   @example
  #
  #     it 'should be able to add bookmarks' {
  #       authorized_to :manage, :bookmark
  #       post :create, id: 'film_id'
  #     }
  #
  def authorized_to(action, *subject)
    expect(controller).to receive(:authorize!).with(action, *subject)
  end

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
end
