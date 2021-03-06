class ServicesController < ApplicationController
    before_action :authenticate_user!

    def index
        @services = Service.paginate(page: params[:page], per_page: 20)
    end

    def show
        @service = Service.find(params[:id])
    end

end
