class ListsController < ApplicationController
  def index
    retrieve_all_lists
  end

  def show
    retrieve_list
  end

  def create
    if @list = List.create(list_params)
      retrieve_all_lists
    end
  end

  def update
    @list = List.find(params[:id])

    if @list.update(list_params)
      retrieve_all_lists
    end
  end

  def destroy
    @list = List.find(params[:id])

    if @list.destroy
      retrieve_all_lists
    end
  end

  private
    def retrieve_all_lists
      @lists = List.all

      render json: @lists
    end

    def retrieve_list
      @list = List.find(params[:id])

      render json: @list
    end

    def list_params
      params.require(:list).permit(
        :name,
        :description
      )
    end
end
