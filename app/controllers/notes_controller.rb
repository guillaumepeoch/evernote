class NotesController < ApplicationController
  
  def index
    @notes = Note.all
  end
  
  def show
    @note = Note.find(params[:id])
  end
  
  def new
    @note = Note.new
  end
  
  def create
    if Note.create(note_params)
      redirect_to :action => 'index'
    else
      render :new
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
  
end
