class CallbacksController < ApplicationController

    def twitter
        @user = User.from_omni(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end


end
