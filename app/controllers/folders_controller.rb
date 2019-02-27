class FoldersController < ApplicationController
  before_action :menu_requests, only: [:index, :new, :edit]
  
  def index
    @folder = Folder.new
  end

  def new
    @folder = Folder.new
  end
  
  def edit
    @folder = Folder.find(params[:id])
  end

  def create
    folder = Folder.new(folder_params)
    if folder.save
      flash[:notice] = "The folder #{folder_params[:name]} was created successfully"
      redirect_to folder_notes_path(folder.id)
    else
      render :new
    end
  end

  def update
    if Folder.find(params[:id]).update(folder_params)
      flash[:notice] = "The folder #{folder_params[:name]} was updated successfully"
      redirect_to :action => 'index'
    else
      render :edit
    end
  end

  def destroy
    if Folder.destroy(params[:id])
        flash[:notice] = "The folder was deleted successfully"
        redirect_to :action => 'index'
    end
  end
  
  private
  
  def menu_requests
    @folders = Folder.order('updated_at DESC')
    @notes = Array.new
  end

  def folder_params
    params.require(:folder).permit(:name)
  end
end
