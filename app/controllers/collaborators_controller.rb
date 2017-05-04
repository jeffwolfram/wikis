class CollaboratorsController < ApplicationController
  before_action :make_wiki


  def create
    @user = User.where(email: params[:email]).first

    if @user.nil?
      flash[:error] = "No user with email #{params[:email]}"
    elsif @wiki.users.include?(@user)
      flash[:error] = "User already a collaborator"
    elsif @wiki.user == @user
      flash[:error] = "this email belongs to the owner of the wiki"
    elsif Collaborator.create(wiki: @wiki, user: @user)
      flash[:notice] = "#{params[:email]} added as a collaborator"
    else
      flash[:error] = "Something went wrong"
    end

    redirect_to edit_wiki_path(@wiki)
  end

  def destroy
    collaborator = Collaborator.find(params[:id])
    if collaborator.delete
      redirect_to @wiki, notice: "#{collaborator.user.email } was removed as a collaborator"
    else
      flash[:error] = "Something went wrong"
    end
  end

  private
  def make_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
