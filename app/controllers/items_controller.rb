class ItemsController < ApplicationController
  def index
  end

  def show
    @registry = Registry.find(params[:registry_id])
    @item = @registry.items.find(params[:id])
  end

  def buy
    @item = Item.find(params[:id])
  end

  def update_buy
    @item = Item.find(params[:id])
    @registry = Registry.find(@item.registry_id)
    if params[:quantity].to_i > @item.quantity - @item.qtybought
      flash[:error] = 'Can\'t buy more than quantity left.'
      render :action => "buy"
    else
      @item.qtybought = @item.qtybought + params[:quantity].to_i
      @item.save
      flash[:notice] = "Sucessfully bought this item."
      redirect_to(@registry)
    end
  end

  def new
    @registry = Registry.find(params[:registry_id])
    @item = @registry.items.build
  end

  def create
    @registry = Registry.find(params[:registry_id])
    @item = @registry.items.build(params[:item])
    @item.qtybought = 0;
    if @item.save
      redirect_to registry_path(@registry)
    else
      render :action => "new"
    end
  end

  def edit
    @item = Item.find(params[:id])
    @registry = Registry.find(@item.registry_id)
  end

  def update
    @item = Item.find(params[:id])
    @registry = Registry.find(@item.registry_id)
    if @item.update_attributes(params[:item])
      flash[:notice] = "Item successfully updated."
      redirect_to registry_path(@registry)
    else
      render :action => "edit"
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @registry = Registry.find(@item.registry_id)
    @item.destroy

    respond_to do |format|
      format.html { redirect_to registry_path(@registry) }
      format.xml { head :ok }
    end
  end

end
