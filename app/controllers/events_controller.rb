class EventsController < ApplicationController

  def index
    @events = Event.all
    
    respond_to do |format|
      format.html
    end
  end

  def show
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @event = Event.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    flash[:notice] = "Event deleted."
    respond_to do |format|
      format.html { redirect_to(events_url) }
    end
  end
end
