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
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note
    else
      render :new
    end
  end
  
  def update
    note = Note.find(params[:id])
    binding.pry
    if note.update(note_params)
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
  
  def note_params
    params.require(:note).permit(:title, :content)
  end
  
end
