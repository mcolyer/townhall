class MeetingsController < ApplicationController
  respond_to :html, :only => [:index, :show]
  respond_to :json, :only => [:create, :show]
  skip_before_filter :verify_authenticity_token

  def index
    @meetings = Meeting.all
  end

  def create
    @meeting = Meeting.create(params[:meeting])
    respond_with(@meeting, :location => @meeting)
  end

  def show
    respond_with(@meeting = Meeting.find(params[:id]))
  end
end
