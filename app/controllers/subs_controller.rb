class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :update, :destroy]

  def index
    @subs = Subs.all
  end

  def show
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.save ? redirect_to subs_path : (render :new)
  end

  def edit
  end

  def update
    @sub.update(sub_params) ? redirect_to subs_path : (render :edit)
  end

  def destroy
    Sub.destroy
    redirect_to subs_path
  end

  private

  def sub_params
    params.require(:model_name).permit(:name)
  end

  def set_sub
    @sub = Sub.find(params[:id])
  end

end
