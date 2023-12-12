class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /lists
  def index
    @lists = List.all
    respond_with @lists
  end

  # GET /lists/1
  def show
    @list = List.find(params[:id])
    @tasks = @list.tasks.order(due_date: :asc)
    
    flash[:notice] = 'Your flash message here' if request.format.html?
    
    respond_to do |format|
      format.html
      format.json { render json: @list }
    end
  end

  # GET /lists/new
  def new
    @list = List.new
    respond_with @list
  end

  # GET /lists/1/edit
  def edit
    respond_with @list
  end

  # POST /lists
  def create
    @list = List.new(list_params)
    if @list.save
      respond_with @list
    else
      respond_with @list.errors, status: :unprocessable_entity
    end
  end

  # PUT /lists/1
  def update
    if @list.update(list_params)
      respond_with @list
    else
      respond_with @list.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lists/1
  def destroy
    @list.destroy
    respond_with @list
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title) # Add other permitted attributes here
  end
end
