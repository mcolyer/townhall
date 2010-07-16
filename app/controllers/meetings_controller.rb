class MeetingsController < ApplicationController
  respond_to :html, :except => [:create]
  respond_to :json, :only => [:create]

  def index
    @meetings = Meeting.all
  end

  def create
    @meeting = Meeting.new(params[:meeting])

    if @meeting.save
      redirect_to @meeting
    else
      render :json => @meeting.errors, :status => :unprocessable_entity
    end
  end
end
