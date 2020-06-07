module CurrentUserConcern

  extend ActiveSupport::Concern

  def current_user
    super || guest_user
  end

  def guest_user
      OpenStruct.new(name:"Invitado",
      	             first_name:"guest",
      	             last_name:"guest",
      	             email:"guest@guest.com")
  end

end