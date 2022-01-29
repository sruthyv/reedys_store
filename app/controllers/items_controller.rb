class ItemsController < ActionController::Base
  def index
    @items = Item.all
  end

  def edit
    @item = item
  end

  def update
    item.update(item_params)
    redirect_to(item)
  end

  def show
    @item = item
  end

  def add_to_cart
    @CART << params['item_id']
    redirect_to items_path
  end

  def checkout

  end

  private

  def item_params
    params.require(:item).permit(:price, :id)
  end

  def item
    @item ||= Item.find_by(id: params[:id])
  end
end
