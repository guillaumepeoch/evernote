class NotesController < ApplicationController
  
  skip_before_action :verify_authenticity_token
  
  def index
    @notes = Note.where(folder_id: params[:folder_id]).order('updated_at DESC')
    @folders = Folder.order('updated_at DESC')
    @folder = Folder.find(params[:folder_id])
  end
  
  def show
    @folders = Folder.order('updated_at DESC')
    @notes = Note.where(folder_id: params[:folder_id]).order('updated_at DESC')
    @note = Note.find(params[:id])
    @folder = Folder.find(params[:folder_id])
  end
  
  def edit
    @folders = Folder.order('updated_at DESC')
    @folder = Folder.find(params[:folder_id])
    @note = Note.find(params[:id])
  end
    
  def new
    @folders = Folder.order('updated_at DESC')
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
      flash[:notice] = "The Note was deleted successfully"
      redirect_to :action => 'index'
    end
  end
  
  private
  
  def note_params
    params.require(:note).permit(:title, :content)
  end
  
end
