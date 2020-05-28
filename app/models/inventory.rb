class Inventory < ApplicationRecord

    belongs_to :user
    has_many :inventory_services
    has_many :services, through: :inventory_services

    validates :name, presence: true, length: { minimum: 6, maximum: 50 }
    validates :location, presence: true, length: { minimum: 2, maximum: 100 }
end
