# frozen_string_literal: true
RSpec.describe BlockPolicy do
  subject { described_class }
  let(:guest) { FactoryGirl.create(:user) }
  let(:block) { FactoryGirl.create(:block_) }
  let(:owner) { block.lecture.course.company.owner }

  permissions :create?, :new? do
    it 'nil user can`t create a new Block' do
      expect(subject).not_to permit(nil, Block.new)
    end

    it 'User can create a new Block' do
      expect(subject).to permit(FactoryGirl.create(:user), Block.new)
    end
  end
  #
  permissions :edit?, :update?, :destroy? do
    it 'access granted if is User is Owner' do
      expect(subject).to permit(owner, block)
    end

    it 'denied access if User is not Owner' do
      expect(subject).not_to permit(guest, block)
    end

    it 'denied access if User is nil' do
      expect(subject).not_to permit(nil, block)
    end
  end
end
