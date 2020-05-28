class InventoryCategory < ApplicationRecord
    belongs_to :inventory 
    belongs_to :service
end