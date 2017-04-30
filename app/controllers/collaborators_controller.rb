class CollaboratorsController < ApplicationController
  before_action :make_wiki

  def new
  end

  def create
    @collaborator = @wiki.collaborators.new(user_email => params[:user_email])

    if @collaborator.save
      flash[:notice] = "User was added to Wiki."
    else
      flash[:alert] = "An error occured adding a user. Please try again."
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @users = User.all
  end

  def show
  end

  private
  def make_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
