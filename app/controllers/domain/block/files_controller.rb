# frozen_string_literal: true

class Domain::Block::FilesController < Domain::Block::ApplicationController
  before_action :set_file

  private

  def set_file
    @blockable = Block::File.find params[:id]
  end

  def blockable_params
    params.require(:block_file).permit(:file)
  end
end
