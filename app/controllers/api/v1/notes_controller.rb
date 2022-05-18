class Api::V1::NotesController < Api::V1::CustomApiApplicationController
  def index
    @notes = Note.order(created_at: :desc)

    render json: @notes
  end

  def create
    @note = Note.new(note_params)

    return render json: @note if @note.save

    render json: @note.errors
  end

  def destroy
    @note = Note.where(id: params[:id]).first

    return render json: @note if @note&.destroy

    render json: {error: "Erro ao tentar apagar registro"}, status: :unprocessable_entity
  end

  private

  def note_params
    params.require(:note).permit(:title, :description, :resolving_date)
  end
end
