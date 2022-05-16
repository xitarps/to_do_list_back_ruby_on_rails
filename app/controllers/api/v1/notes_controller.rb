class Api::V1::NotesController < Api::V1::CustomApiApplicationController
  def index
    @notes = Note.all

    render json: @notes
  end
end
