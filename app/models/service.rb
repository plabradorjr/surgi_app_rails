class Service < ApplicationRecord

    validates :name, presence: true, length: { maximum: 25 }
    validates_uniqueness_of :name
    has_many :inventory_services
    has_many :inventories, through: :inventory_services

end
