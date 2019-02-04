class NotesController < ApplicationController
  def index
    @notes = Note.where(folder_id: params[:folder_id])
    @folder = Folder.find(params[:folder_id])
  end
  
  def show
    @note = Note.find(params[:id])
    @folder = Folder.find(params[:folder_id])
  end
  
  def edit
    @folder = Folder.find(params[:folder_id])
    @note = Note.find(params[:id])
  end
    
  def new
    @folder = Folder.find(params[:folder_id])
    @note = @folder.notes.new
  end
  
  def create
    @folder = Folder.find(params[:folder_id])
    if @folder.notes.create(note_params)
      flash[:notice] = "The Note #{note_params[:title]} was created successfully"
      redirect_to :action => 'index'
    else
      redirect_to :action => 'new'
    end
  end
  
  def update
    if Note.find(params[:id]).update(note_params)
      flash[:notice] = "The Note #{note_params[:title]} was updated successfully"
      redirect_to :action => 'index'
    else
      render :new
    end
  end
  
  def destroy
    if Note.destroy(params[:id])
      binding.pry
      flash[:notice] = "The Note was deleted successfully"
      redirect_to :action => 'index'
    end
  end
  
  private
  
  def note_params
    params.require(:note).permit(:title, :content)
  end
  
end
