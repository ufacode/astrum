class Domain::Block::ApplicationController < Domain::ApplicationController
  before_action :set_block, only: [:edit, :update]

  private

  def set_block
    @block = ::Block.find params[:block_id]
  end
end
