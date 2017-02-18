# describe 'user roles' do
#   pending 'disabled'
#
#   it 'render the login, registration, and password reset form when request is to the root path' do
#     visit root_path
#     assert_equal '/', page.current_path
#     assert page.has_selector?('form#login-form')
#   end
#
#   context 'logging in' do
#     it 'show login error when login fails' do
#       visit root_path
#       within('#login-form') do
#         fill_in 'email', :with => 'xyz@abc.org'
#         fill_in 'password', :with => 'someFunky1Password'
#       end
#       click_button 'Login'
#       assert page.has_selector?('form#login-form div.alert-error')
#     end
#
#     it 'show logged in home page when login succeeds' do
#       user = FactoryGirl.create(:user)
#       visit root_path
#       within('#login-form') do
#         fill_in 'email', :with => user.email
#         fill_in 'password', :with => user.password
#       end
#       click_button 'Login'
#       assert_equal '/', page.current_path
#       assert page.has_selector?('a[href="'+  destroy_user_session_path + '"]')
#     end
#   end
#
#   context 'Signing up' do
#     it 'show logged in home page when signup succeeds' do
#       visit root_path
#       click_link 'Sign up'
#       wait_until { page.has_selector?('#signup-form', :visible => true) }
#       attrs = FactoryGirl.attributes_for(:user)
#       within('#signup-form') do
#         fill_in 'email', :with => attrs[:email]
#         fill_in 'password', :with => attrs[:password]
#         fill_in 'password_confirmation', :with => attrs[:password_confirmation]
#       end
#       click_button 'Sign up'
#       assert_equal '/', page.current_path
#       assert page.has_selector?('a[href="'+  destroy_user_session_path + '"]')
#     end
#
#     it 'show an error message when signup fails' do
#       visit root_path
#       click_link 'Sign up'
#       wait_until { page.has_selector?('#signup-form', :visible => true) }
#       within('#signup-form') do
#         fill_in 'email', :with => 'someone@example.org'
#         fill_in 'password', :with => '123'
#         fill_in 'password_confirmation', :with => '1234567'
#       end
#       click_button 'Sign up'
#       assert page.has_selector?('form#signup-form div.alert-error')
#     end
#   end
# end
