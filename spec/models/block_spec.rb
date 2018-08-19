# frozen_string_literal: true

RSpec.describe Block, type: :model do
  context 'with order' do
    before do
      @lecture = FactoryBot.create(:lecture)
      @block1 = @lecture.blocks.create!
      @block2 = @lecture.blocks.create!
    end

    it 'fetch blocks by order' do
      expect(@lecture.blocks.to_a).to eq [@block1, @block2]
    end
  end
end
