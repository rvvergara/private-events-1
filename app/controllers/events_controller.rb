class EventsController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :index]

    def new
        @event = Event.new
    end

    def index
      @events = Event.order("created_at")
      @upcoming = Event.upcoming
      @past_events = Event.past
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

  
    private

    def events_params
        params.require(:event).permit(:titre, :content, :location, :event_date)
    end

    def logged_in_user
        unless logged_in?
          flash[:danger] = "Please Log in"
          redirect_to login_url
        end
      end

end
