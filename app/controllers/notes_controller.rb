class NotesController < ApplicationController
  
  before_action :menu_requests, only: [:index, :show, :edit, :new]
  
  def index
    @notes = Note.where(folder_id: params[:folder_id]).order('updated_at DESC')
  end
  
  def show
    @notes = Note.where(folder_id: params[:folder_id]).order('updated_at DESC')
    @note = Note.find(params[:id])
  end
  
  def edit
    @note = Note.find(params[:id])
  end
    
  def new
    @notes = Note.where(folder_id: params[:folder_id]).order('updated_at DESC')
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
  
  def menu_requests
    @folders = Folder.order('updated_at DESC')
    @folder = Folder.find(params[:folder_id])
  end
  
  def note_params
    params.require(:note).permit(:title, :content)
  end
  
end
