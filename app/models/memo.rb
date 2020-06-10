class Memo < ApplicationRecord

    belongs_to :user
    has_many :memo_services
    has_many :services, through: :memo_services

    validates :title, presence: true
    validates :description, presence: true

end
