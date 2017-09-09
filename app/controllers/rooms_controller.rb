class RoomsController < ApplicationController
  before_action :set_room,except:[:index,:new,:create]
  before_action :authenticate_user! ,except:[:show]
  
  def index
    @rooms = current_user.rooms
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    
    if @room.save
      redirect_to listing_room_path(@room), notice: "Saved Success"
    else
      flash[:alert] = @room.errors.full_messages
      render :new
    end
  end

  def show
    @photos = @room.photos
  end

  def listing
  end

  def pricing
  end

  def description
  end

  def photo_upload
    @photos = @room.photos
  end

  def amenities
  end

  def location
  end

  def update
    if @room.update(room_params)
      flash[:notice] = "Saved..."
    else
      flash[:alert] = @room.errors.full_messages
    end
    redirect_back(fallback_location: request.referer)
  end
  private 
    def set_room
      @room = Room.find(params[:id]);
    end
    def room_params
      params.required(:room).permit(:home_type,:room_type,:accommodate,:bed_room,:bath_room,:listing_name,:summary,:address,:is_kitchen,:is_air,:is_internet,:is_tv,:price,:active)
    end
end
