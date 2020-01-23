class Cat < ApplicationRecord
    validates :name, presence: true
    validates :age, presence: true
    validates :city, presence: true
    validates :bio, presence: true
end
