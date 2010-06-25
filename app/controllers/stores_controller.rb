class StoresController < ApplicationController
  def index
  end

  def show
   @store = Store.find(params[:id]) 
  end

  def new
    @store = Store.new

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
        format.html { redirect_to(@store) }
        format.xml  { render :xml => @store, :status => :created, :location => @store }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @store.errors, :status => :unprocessable_entity }
      end
    end
  end



  def edit
  end

end
