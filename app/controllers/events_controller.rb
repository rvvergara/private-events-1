class EventsController < ApplicationController


    def new
        @event = Event.new
    end

    def index
      @events = Event.order("created_at")
    end

    def show
      @event = Event.find_by(id: params[:id])}
      @attendance = Attendance.new
    end

    def create
        @event = current_user.events.build(events_params)
        if @event.save
            flash[:alert] = "Created event"
            redirect_to @event
        else
            render :new
        end
    end


    private

    def events_params
        params.require(:event).permit(:titre, :content, :location, :event_date)
    end

end
