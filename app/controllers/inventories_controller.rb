class InventoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @inventories = Inventory.paginate(page: params[:page], per_page: 5)
    end

    def show
        set_inventory
    end

    def new
        @inventory = Inventory.new
    end

    def create
        @inventory = Inventory.new(inventory_params)
        @inventory.user = current_user
        if @inventory.save
            flash[:notice] = "Inventory was created successfully."
            redirect_to @inventory
        else
            render 'new'
        end
    end

    def edit
        set_inventory
    end


    private

    def set_inventory
        @inventory = Inventory.find(params[:id])
    end

    def inventory_params
        params.require(:inventory).permit(:name, :location, :info)
    end

    def require_same_user
        if current_user != @inventory.user
            flash[:alert] = "You can only edit or delete your own inventory"
            redirect_to @inventory
        end
    end

end
