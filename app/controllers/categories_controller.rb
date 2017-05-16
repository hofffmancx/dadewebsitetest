class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin!
  layout 'admin'

  def index
	   @categories = Category.all
   end

  def new
    @category = Category.new
  end

  def show
  end

  def edit
  end


  def create
	   @category = Category.new(category_params)

      respond_to do |format|

	       if @category.save
  	        format.html { redirect_to @category, notice: '新建分类成功' }
    	      format.json { render :show, status: :created, location: @category }
  	     else
    	      format.html { render :new }
    	      format.json { render json: @category.errors, status: :unprocessable_entity }
  	     end
	    end
  end

  def update
	   respond_to do |format|
  	 if @category.update(category_params)
    	  format.html { redirect_to @category, notice: '修改分类成功' }
    	format.json { render :show, status: :ok, location: @category }
  	else
    	format.html { render :edit }
    	format.json { render json: @category.errors, status: :unprocessable_entity }
  	end
	 end
 end

 def destroy
	  @category.destroy
	   respond_to do |format|
  	    format.html { redirect_to categories_url, alert: '删除分类成功' }
  	     format.json { head :no_content }
	      end
      end

      private

      def set_category
        @category = Category.find(params[:id])
      end

      def category_params
        params.require(:category).permit(:name, :description)
      end

end
