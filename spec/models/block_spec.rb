# frozen_string_literal: true

RSpec.describe Block, type: :model do
  subject! { FactoryGirl.build(:block_text) }

  context 'with order' do
    before do
      @lecture = FactoryGirl.create(:lecture)
      @block1 = @lecture.blocks.create!
      @block2 = @lecture.blocks.create!
    end

    it 'fetch blocks by order' do
      expect(@lecture.blocks.to_a).to eq [@block1, @block2]
    end
  end
end
