class KindsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'

  def index
    @kinds = Kind.all
  end

  def show
    @kind = Kind.find(params[:id])
  end

  def new
    @kind = Kind.new

  end

  def create
    @kind = Kind.new(kind_params)

    if @kind.save
      redirect_to kinds_path
    else
      render :new
    end
  end

  def edit
    @kind = Kind.find(params[:id])

  end

  def update
    @kind = Kind.find(params[:id])

    if @kind.update(kind_params)
      redirect_to kinds_path
    else
      render :edit
    end
  end

  def destroy
    @kind = Kind.find(params[:id])
    @kind.destroy
    redirect_to kinds_path
  end

  private

    def kind_params
      params.require(:kind).permit(:name, :description)
    end


end
