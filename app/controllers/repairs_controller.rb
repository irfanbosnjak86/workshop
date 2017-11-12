class RepairsController < ApplicationController 
  before_action :authenticate_user!
  before_action :set_repair, only: [:show]

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
    @repair.save
    redirect_to repairs_path
  end

  private 

  def repair_params
    params.require(:repair).permit(:title, :malfunction_desc, :repair_desc, :repair_date, :status, :price)
  end

  def set_repair
    @repair = Repair.find(params[:id])
  end
end