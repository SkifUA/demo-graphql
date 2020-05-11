module UserInteractors
  class Logout < ApplicationInteractor
    delegate :refresh_token, to: :context

    def call
      session = JWTSessions::Session.new
      session.flush_by_token(refresh_token)
    end

    def validation
      context.fail!(message: "logout_user.failure") if refresh_token.blank?
    end
  end
end