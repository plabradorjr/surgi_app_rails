class InventoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        if params[:user_id]
            @inventories = User.find(params[:user_id]).inventories.paginate(page: params[:page], per_page: 5)
        else
            @inventories = Inventory.paginate(page: params[:page], per_page: 5)
        end
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
            flash[:success] = "Successfully Saved! Woot!"
            redirect_to @inventory
        else
            flash[:notice] = "Sorry, 'Name' and 'Location' cannot be blank."
            render 'new'
        end
    end

    def edit
        set_inventory
    end

    def update
        set_inventory
        if @inventory.update(inventory_params)
            flash[:notice] = "Updated successfully"
            redirect_to inventory_path(@inventory)
        else
            flash[:notice] = "unsuccessful update. try again"
            redirect_to inventory_path(@inventory)

        end
    end

    def destroy
        set_inventory
        @inventory.destroy
        redirect_to inventories_path
    end

    private

    def set_inventory
        @inventory = Inventory.find(params[:id])
    end

    def inventory_params
        params.require(:inventory).permit(:name, :location, :info, service_ids: [])
    end

    def require_same_user
        if current_user != @inventory.user
            flash[:alert] = "You can only edit or delete your own inventory"
            redirect_to @inventory
        end
    end

end
