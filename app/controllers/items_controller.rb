class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def edit
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:success] = 'Item was successfully created.'
      redirect_to @item
    else
      render :new 
    end
  end

  def update
    if @item.update(item_params)  
      flash[:success] = 'Item was successfully updated.'
      redirect_to @item 
    else
      render :edit 
    end
  end

  def destroy
    @item.destroy

    flash[:alert] = 'Item was successfully destroyed.'
    redirect_to items_url
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :status, :received_date, :workshop_id)
    end
end
