class NotesController < ApplicationController
  def create
    @home = Home.find(params[:id])
    @note = Note.new
    @note.home = @home
  end
end
