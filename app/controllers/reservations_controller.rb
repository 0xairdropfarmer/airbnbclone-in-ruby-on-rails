class ReservationsController < ApplicationController
    before_action :authenticate_user!
    def create
   room = Room.find(params[:room_id])
    
    if current_user == room.user
      flash[:alert] = "You can't book own room"
     else 
      start_date = Date.parse(reservations_params[:start_date])
      end_date = Date.parse(reservations_params[:end_date])
      days = (end_date - start_date).to_i + 1
      
      reservations = current_user.reservations.build(reservations_params)
      reservations.room = room
      reservations.price = room.price
      reservations.total = room.price * days
      reservations.save
        
      flash[:notice] = "booking success"
     end
      redirect_to room
    end
    private 
        def reservations_params
            params.require('reservation').permit(:start_date, :end_date)
        end
    
    
end
