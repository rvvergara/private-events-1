class EventsController < ApplicationController


    def new
        @event = Event.new
    end

    def index
      @events = Event.order("created_at")
      @past_events = Event.past
      @coming_events = Event.coming
    end

    def show
      @event = Event.find_by(id: params[:id])
      @attendances = @event.attendees
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

    def past
      Event.where("event_date < ?", Time.now.strftime("%Y-%m-%d") ).order(event_date: :desc)
    end

    def coming
      Event.where("event_date > ?", Time.now.strftime("%Y-%m-%d") ).order(event_date: :asc)
    end


    private

    def events_params
        params.require(:event).permit(:titre, :content, :location, :event_date)
    end

end
