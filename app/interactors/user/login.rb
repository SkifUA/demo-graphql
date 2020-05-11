module User
  class Login < ApplicationInteractor
    delegate :input, to: :context

    def call
      session = JWTSessions::Session.new(
          payload: { user_id: user.id },
          refresh_payload: { user_id: user.id }
      )
      context.result = session.login
    end

    def validation
      context.fail!(message: "authenticate_user.failure") if user.blank?
    end

    private

    def user
      @user ||= ::User.find_by_email(input.email)&.authenticate(input.password)
    end
  end
end