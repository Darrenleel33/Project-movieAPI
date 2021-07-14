class User < ActiveRecord::Base
    has_many :bookings
    has_many :movies, through: :bookings
end