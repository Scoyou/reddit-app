class TopicsController < ApplicationController
  before_action :set_sub
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
  end

  def new
    @topic = Topic.new(topic_params)
  end

  def create
    @topic.save ? (redirect_to [@sub, @topic]) : (render :new)
  end

  def edit
  end

  def update
    @topic.update(topic_params) ? (redirect_to [@sub, @topic]) :
                                  (render :edit)
  end

  def destroy
    @topic.destroy
    redirect_to sub_topics_path
  end

  private
  
  def topic_params
    params.require(:topic).permit(:name, :body)
  end

  def set_sub
    @sub = Sub.find(params[:sub_id])
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end

end
