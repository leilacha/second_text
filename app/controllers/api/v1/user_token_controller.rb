# frozen_string_literal: true

module Api
  module V1
    # controller for authentication
    class UserTokenController < Knock::AuthTokenController
      skip_before_action :verify_authenticity_token
    end
  end
end
