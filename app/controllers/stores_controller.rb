class StoresController < ApplicationController
  def index
    @stores = Store.all

    respond_to do |format|
      format.html
      format.xml { render :xml => @stores }
    end
  end

  def show
   @store = Store.find(params[:id]) 
  end

  def new
    @store = Store.new
    
    session[:return_to] ||= request.referer # store referring url
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @store }
    end
  end

def create
    @store = Store.new(params[:store])
    
    respond_to do |format|
      if @store.save
        flash[:notice] = 'Store was successfully added.'
        format.html { redirect_to session[:return_to] }
        format.xml  { render :xml => @store, :status => :created, :location => @store }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
      end
    end
  end



  def edit
    @store = Store.new(params[:store])
  end

  def update
    @store = Store.find(params[:id])

    respond_to do |format|
      if @store.update_attributes(params[:store])
        flash[:notice] = 'Store was successfully updated.'
        format.html { redirect_to(@store) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @store.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @store = Store.find(params[:id])
    @store.destroy

    respond_to do |format|
      format.html { redirect_to(stores_url) }
      format.xml { head :ok }
    end  
  end
  
end
