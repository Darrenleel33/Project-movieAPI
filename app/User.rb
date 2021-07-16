class User < ActiveRecord::Base
    has_many :bookings
    has_many :movies, through: :bookings


    def booking_and_movie
        {
            movie_bookings: self.bookings.map do |booking| 
                {booking_time: booking.showtime.asctime, movie: booking.movie}
            end 
        }
    end 

    
end