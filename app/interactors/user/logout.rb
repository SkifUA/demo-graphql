module User
  class Logout < ApplicationInteractor
    delegate :found_refresh_token, to: :context

    def call
      session = JWTSessions::Session.new
      session.flush_by_token(found_refresh_token)
    end

    def validation
      context.fail!(message: "logout_user.failure") if found_refresh_token.blank?
    end
  end
end