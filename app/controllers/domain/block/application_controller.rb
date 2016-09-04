# frozen_string_literal: true
class Domain::Block::ApplicationController < Domain::ApplicationController
  before_action :set_block, only: [:edit, :update]

  def edit
    render block_view('edit')
  end

  def update
    render @blockable.update(blockable_params) ? block_view('show') : block_view('edit')
  end

  def show; end

  private

  def block_view(name)
    "domain/shared/block/#{name}"
  end

  def set_block
    @block = ::Block.find params[:block_id]
  end
end
