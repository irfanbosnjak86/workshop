class WorkshopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_workshop, only: [:show, :edit, :update, :destroy]

  def index
    if params[:owned]
      @workshops = Workshop.where(user_id: current_user)
    else
      @workshops = Workshop.all
    end
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
      flash[:success] = 'Workshop was successfully created.'
      redirect_to @workshop
    else
      render :new 
    end
  end

  def update
    if @workshop.update(workshop_params)
      flash[:success] = 'Workshop was successfully updated.'
      redirect_to @workshop  
    else
      render :edit
    end
  end

  def destroy
    @workshop.destroy
    flash[:alert] = 'Workshop was successfully destroyed.'
    redirect_to workshops_url
  end

  private

    def set_workshop
      @workshop = Workshop.find(params[:id])
    end

    def workshop_params
      params.require(:workshop).permit(:name, :description, :user_id)
    end
end
