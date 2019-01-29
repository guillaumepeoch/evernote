class FoldersController < ApplicationController  
  def index
    @folders = Folder.all
  end

  def show
    @folder = Folder.find(params[:id])
  end

  def new
    @folder = Folder.new
  end

  def create
    if Folder.create(folder_params)
      redirect_to :action => 'index'
    else
      render :new
    end
  end

  def update
    if Folder.find(params[:id]).update(folder_params)
      redirect_to :action => 'index'
    else
      render :new
    end
  end

  def destroy
    if Folder.destroy(params[:id])
        redirect_to :action => 'index'
    end
  end
  
  def get_notes
    folder = Folder.find(params[:id])
    puts "folder: #{folder}"
    render :json => folder.notes
  end
  
  private

  def folder_params
    params.require(:folder).permit(:name)
  end
end
