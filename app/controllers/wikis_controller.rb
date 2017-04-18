class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
    authorize @wikis
    # policy_scope(Wiki)
  end
  def show
    @wiki = Wiki.find(params[:id])
  end
  def new
    @wiki = Wiki.new
    authorize @wiki
  end
  def create
    @wiki = Wiki.new(wiki_params)
    @wiki.user = current_user

    if @wiki.save
      flash[:notice] = "Your wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error in saving your wiki. Please try again"
      render :new
    end
  end
  def edit
    @wiki = Wiki.find(params[:id])
  end
  def update
    @wiki = Wiki.find(params[:id])
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "there was an error in saving the wiki. Try again."
      render :edit
    end
  end
  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki"
      render :show
    end
  end
  private
  def wiki_params
    params.require(:wiki).permit(:title, :body, :private)
  end
end
