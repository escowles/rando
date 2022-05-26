class ListsController < ApplicationController
  before_action :set_list, only: %i[ show destroy add remove ]

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
      redirect_to list_path(@list.code)
    else
      render :show, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    redirect_to lists_url, notice: "List was successfully destroyed."
  end

  # POST /lists/1/add
  def add
    @value = Value.new(list_id: @list.id, text: params[:text])
    if @value.save
      redirect_to list_path(@list.code), notice: "Value was successfully added."
    else
      render :show, status: :unprocessable_entity
    end
  end

  # POST /lists/1/remove
  def remove
    @value = Value.find_by(list_id: @list.id, id: params[:value_id])
    @value.destroy
    redirect_to list_path(@list.code), notice: "Value was successfully removed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find_by(code: params[:id])
    end
end
