class WorkshopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_workshop, only: [:show, :edit, :update, :destroy]

  def index
    @workshops = Workshop.all
  end

  def show
  end

  def new
    @workshop = current_user.workshops.new
  end

  def edit
  end

  def create
    @workshop = current_user.workshops.new(workshop_params)

    if @workshop.save
      redirect_to @workshop, notice: 'Workshop was successfully created.'
    else
      render :new 
    end
  end

  def update
    if @workshop.update(workshop_params)
      redirect_to @workshop, notice: 'Workshop was successfully updated.' 
    else
      render :edit
    end
  end

  def destroy
    @workshop.destroy
    redirect_to workshops_url, notice: 'Workshop was successfully destroyed.' 
  end

  private

    def set_workshop
      @workshop = Workshop.find(params[:id])
    end

    def workshop_params
      params.require(:workshop).permit(:name, :description, :user_id)
    end
end
