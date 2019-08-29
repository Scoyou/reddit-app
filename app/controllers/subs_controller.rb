class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :update, :destroy]

  def index
    @subs = Sub.all
  end

  def show
  end

  def new
    @sub = Sub.new
    render partial: 'form'
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.save ? (redirect_to subs_path) : (render :new)
  end

  def edit
    render partial: 'form'
  end

  def update
    @sub.update(sub_params) ? (redirect_to subs_path) : (render :edit)
  end

  def destroy
    @sub.destroy
    redirect_to subs_path
  end

  private

  def sub_params
    params.require(:sub).permit(:name)
  end

  def set_sub
    @sub = Sub.find(params[:id])
  end
end
