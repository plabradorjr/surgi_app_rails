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
        if params[:search] == ""
            render 'home'
        else
            x = params[:search].downcase.strip
            @inventory_results = Inventory.where("LOWER(name) LIKE?", "%#{x}%")
            @memo_results = Memo.where("LOWER(title) LIKE?", "%#{x}%")
        end
    end


end