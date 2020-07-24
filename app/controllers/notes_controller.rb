class NotesController < ApplicationController
  def index
    @notes = policy_scope(Note)
  end

  def new
    @note = Note.new
  end

  def create
    @home = Home.find(params[:home_id])
    @booking = Booking.new
    @note = Note.new(note_params)
    @note.user = current_user
    @note.home = @home
    authorize @note

    if @note.save!
      redirect_to home_path(@home)
    else
      render "homes/show"
    end
  end

  private

  def note_params
    params.require(:note).permit(:content)
  end
end
