class RepairsController < ApplicationController 
  before_action :authenticate_user!
  before_action :set_repair, only: [:show, :edit, :update, :destroy]

  def index
    @repairs = Repair.all.order("created_at DESC")
  end

  def show
  end

  def new
    @repair = Repair.new
  end

  def create
    @repair = Repair.new(repair_params)
    if @repair.save
      flash[:success] = "Repair added."
      redirect_to repairs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @repair.update(repair_params)
      flash[:success] = "Repair Updated"
      redirect_to repair_path(@repair)
    else
      render :edit
    end
  end

  def destroy
    @repair.destroy
    redirect_to repairs_path
    flash[:danger] = "The repair is successfully deleted!"
  end

  private 

    def repair_params
      params.require(:repair).permit(:title, :malfunction_desc, :repair_desc, :repair_date, :status, :price)
    end

    def set_repair
      @repair = Repair.find(params[:id])
    end
end