class TagsController < ApplicationController
  respond_to :json, :only => [:create]
  skip_before_filter :verify_authenticity_token
  before_filter :authenticate_user!, :only => :create

  def create
    @tag = Tag.create(params[:tag])
    respond_with(@tag, :location => @tag)
  end
end
