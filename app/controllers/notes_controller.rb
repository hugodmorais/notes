class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      flash[:success] = 'Criado com sucesso!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      flash[:success] = 'Atualizado com sucesso!'
      redirect_back(fallback_location: root_path)
    else
      render :edit
    end
  end

  def destroy
    if @note.destroy
      redirect_to root_path, notice: :destroyed
    else
      redirect_to root_path, alert: @note.errors[:base]&.first
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:name, :color, :icon, :description, :content)
  end
end
