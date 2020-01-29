class Cat < ApplicationRecord
    validates :name, :age, :city, presence: true
    validates :bio, presence: true, length: {minimum: 10}
end
