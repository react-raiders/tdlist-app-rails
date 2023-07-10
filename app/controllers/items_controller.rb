class ItemsController < ApplicationController

  def index
    retrieve_all_items
  end

  def create

  end

  def show

  end

  def update

  end

  def toggle_complete
    @item = Item.find(params[:id])

    if @item.update(completed: !@item.completed)
      retrieve_all_items(list_id: @item.list_id)
    end
  end

  def destroy

  end

  private
    def retrieve_all_items(options = {})
      list_id = options[:list_id]

      @list_with_items = List.includes(:items).find(params[:list_id] || list_id)
      # @list_with_items = Item.all

      render json: @list_with_items.to_json(include: :items)
    end

    def retrieve_item
      @item = Item.find(params[:id])

      render json: @item
    end

    def item_params
      params.require(:item).permit(
        :description,
        :importance,
        :completed
      )
    end

end
