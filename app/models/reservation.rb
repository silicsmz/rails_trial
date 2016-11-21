class Reservation < ApplicationRecord
  class << self
    def get_list(user_id)
      Rails.logger.debug "==[user_id]==: #{user_id}"
      find_by(user_id: user_id)
    end
  end
end
