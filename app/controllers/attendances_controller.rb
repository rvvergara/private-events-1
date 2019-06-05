class AttendancesController < ApplicationController





    
    def create
        @attendance = Attendance.new(attendance_params)
        if @attendance.save
            flash[:success] = "Invitation sent"
            redirect_to event_path(@attendance.attended_event_id)
        else
            redirect_to event_path
        end

    end


    private 

    def attendance_params
        params.require(:attendance).permit(:attendee_id, :attended_event_id)
    end

 
end
