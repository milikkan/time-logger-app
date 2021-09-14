class CategoriesController < ApplicationController
  include Redirectable

  before_action :set_category, only: %i[ edit update destroy ]
  before_action :redirect_non_admin_users

  # GET /categories
  def index
    @categories = Category.all
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      format.html {
        if @category.save
          redirect_to categories_path, notice: "Category created."
        else
          render :new
        end
      }
    end
  end

  # PATCH/PUT /categories/1
  def update
    respond_to do |format|
      format.html {
        if @category.update(category_params)
          redirect_to categories_path, notice: "Category updated."
        else
          render :edit
        end
      }
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: "Category deleted."
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
