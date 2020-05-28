class InventoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @inventories = Inventory.paginate(page: params[:page], per_page: 5)
    end

    def show
        
    end

end
