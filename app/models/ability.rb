# class Ability
#   include CanCan::Ability
#
#   def initialize(user)
#     current_user = user || User.guest
#
#     if current_user.role?(User::Role::ADMIN)
#       can :manage, :all
#     elsif current_user.role?(User::Role::SUPPORT_MANAGER)
#       can :manage, Ticket
#
#       can :index, User
#       can :show, User
#       can :update, User do |user|
#         !user.role?(User::Role::ADMIN)
#       end
#     elsif current_user.role?(User::Role::CUSTOMER)
#       can :create, Ticket
#       can :index, Ticket, user_id: current_user.id
#       can :show, Ticket do |ticket|
#         ticket.user_id == current_user.id
#       end
#
#       can :index, User, id: current_user.id
#       can :show, User do |user|
#         user.id == current_user.id
#       end
#     end
#   end
# end
