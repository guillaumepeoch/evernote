class NotesController < ApplicationController
  # before_action :set_folder_id, :only => [:new, :create, :show]
  
  def index
    @notes = Note.where(folder_id: params[:folder_id])
    @folder = Folder.find(params[:folder_id])
  end
  
  def show
    @note = Note.find(params[:id])
  end
  
  def new
    @folder = Folder.find(params[:folder_id])
    @note = Note.new(folder_id: params[:folder_id])
  end
  
  def create
    @folder = Folder.find(params[:folder_id])
    if @folder.notes.create(note_params)
      redirect_to :action => 'index'
    else
      redirect_to :action => 'new'
    end
  end
  
  def update
    if Note.find(params[:id]).update(note_params)
      redirect_to :action => 'index'
    else
      render :new
    end
  end
  
  def destroy
    if Note.destroy(params[:id])
        redirect_to :action => 'index'
    end
  end
  
  private
  
  def note_params
    params.require(:note).permit(:title, :content)
  end
  
  def set_folder_id(id)
    @folder_id = id
  end
  
end
