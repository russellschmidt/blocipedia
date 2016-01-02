class CollaboratorsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def new
    @collaborator = Collaborator.new
  end

  def create
    @collaborator = Collaborator.new
  end

  private
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action"
    redirect_to wikis_path
  end

  def collaborator_params
    params.require(:collaborator).permit(:user_id, :wiki_id)
  end

end
