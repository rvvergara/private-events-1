class EventsController < ApplicationController


    def new
        @event = Event.new
    end

    def index

    end

    def show

    end

    def create
        @event = current_user.events.build(events_params)
        if @event.save
            flash[:success] = "Created event"
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
