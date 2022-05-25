class ListsController < ApplicationController
  before_action :set_list, only: %i[ show destroy ]

  # GET /lists
  def index
    @lists = List.all
  end

  # GET /lists/1
  def show
  end

  # POST /lists
  def create
    @list = List.new

    if @list.save
      redirect_to lists_path, notice: "List was successfully created."
    else
      render :show, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_to lists_url, notice: "List was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find_by(code: params[:id])
    end
end
