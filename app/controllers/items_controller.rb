class ItemsController < ApplicationController
  def index
    @registry = Registry.find(params[:registry_id])
    @items = @registry.items
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
    if @item.save
      redirect_to registry_item_url(@registry, @item)
    else
      render :action => "new"
    end
  end

  def edit
    @registry = Registry.find(params[:registry_id])
    @item = @registry.items.find(params[:id])
  end

  def update
    @registry = Registry.find(params[:registry_id])
    @item = Item.find(params[:id])
    if @item.update_attributes(params[:item])
      redirect_to registry_item_url(@registry, @item)
    else
      render :action => "edit"
    end
  end

  def destroy
    @registry = Registry.find(params[:registry_id])
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.html { redirect_to registry_items_path(@registry) }
      format.xml { head :ok }
    end
  end

end
