class RegistriesController < ApplicationController
  def index
    @registries = Registry.find(:all)

    respond_to do |format|
      format.html
    end
  end

  def show
    @registry = Registry.find(params[:id])
    
    respond_to do |format|
      format.html
    end
  end

  def new
    @registry = Registry.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @registry = Registry.new(params[:registry])
    
    if (current_user)
      @registry.user_id = current_user.id
    end
    
    respond_to do |format|
      if @registry.save
        flash[:notice] = 'Registry was successfully created.'
        format.html { redirect_to(@registry) }

      else
        format.html { render :action => "new" }

      end
    end
  end 

  def edit
    @registry = Registry.find(params[:id])
  end

  def update
    @registry = Registry.find(params[:id])

    respond_to do |format|
      if @registry.update_attributes(params[:registry])
        flash[:notice] = 'Registry was successfully updated.'
        format.html { redirect_to(@registry) }
      else
        format.html { render :action => "edit" }
      end
    end

  end

  def destroy
    @registry = Registry.find(params[:id])
    @registry.destroy

    respond_to do |format|
      format.html { redirect_to(registries_url) }
    end
  end
