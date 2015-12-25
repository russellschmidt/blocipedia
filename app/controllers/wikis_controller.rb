class WikisController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :ready_wiki, only: [:show, :edit, :update, :destroy]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    @wikis = Wiki.all
  end

  def show
  end

  def new
    # could put in 'authorize @user' but that seems to be handled by before_action callback already
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params.merge(user_id: current_user.id))

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
    @wiki.update_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was updated"
      redirect_to @wiki
    else
      flash.now[:alert] = "Error saving your wiki - plz try again"
      render :edit
    end
  end

  def destroy
    authorize @wiki
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully"
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki"
      render :show
    end
  end


  private
  def ready_wiki
    @wiki = Wiki.find(params[:id])
  end

  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action"
    redirect_to wikis_path
  end

end
