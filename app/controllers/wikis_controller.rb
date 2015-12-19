class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
  end

  def show
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]
    @wiki.user = params[:current_user]

    if @wiki.save
      flash[:notice] = "Wiki saved"
      redirect_to @wiki
    else
      flash.now[:alert] = "Error saving your wiki occurred! Try again"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
