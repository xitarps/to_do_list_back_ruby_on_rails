class Api::V1::NotesController < Api::V1::CustomApiApplicationController
  def index
    @notes = Note.all

    render json: @notes
  end

  def create
    @note = Note.new(note_params)

    return render json: @note if @note.save

    render json: @note.errors
  end

  private

  def note_params
    params.require(:note).permit(:title, :description, :resolving_date)
  end
end
