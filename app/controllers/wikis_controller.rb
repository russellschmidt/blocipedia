class WikisController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :ready_wiki, only: [:show, :edit, :update, :destroy, :addCollaborator, :removeCollaborator]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def index
    if current_user.standard?
      @wikis = Wiki.where(private: false)
    else
      @wikis = Wiki.all
    end
  end

  def show
    if @wiki.private && current_user.standard?
      flash.now[:alert] = "Free users can't make private wikis :("
      render :index
    end
  end

  def new
    @wiki = Wiki.new
  end

  def create
    @wiki = Wiki.new(wiki_params.merge(user_id: current_user.id))
    if @wiki.private && current_user.standard?
      flash.now[:alert] = "Free users can't make private wikis :("
      render :new
    else
      if @wiki.save
        flash[:notice] = "Wiki saved"
        redirect_to @wiki
      else
        flash.now[:alert] = "Error saving your wiki occurred! Try again"
        render :new
      end
    end
  end

  def edit
    @users =  User.all
  end

  def update
    @wiki.update_attributes(wiki_params)

    if @wiki.private && current_user.standard?
      flash.now[:alert] = "Free users can't make private wikis :("
      render :edit
    else
      if @wiki.save
        flash[:notice] = "Wiki was updated"
        redirect_to @wiki
      else
        flash.now[:alert] = "Error saving your wiki - plz try again"
        render :edit
      end
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

  def addCollaborator
    @wiki.add_collab
    redirect_to edit_wiki_path(@wiki)
  end

  def removeCollaborator
    @wiki.remove_collab
    redirect_to edit_wiki_path(@wiki)
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
