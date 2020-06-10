class WelcomeController < ApplicationController

    def index
        if current_user
            render "home" 
        else
            render "index"
        end
    end
    
    def home
        
    end

    def search
        x = params[:search]
        @inventory_results = Inventory.where("name LIKE?", "%#{x}%")
        @memo_results = Memo.where("title LIKE?", "%#{x}%")
    end


end