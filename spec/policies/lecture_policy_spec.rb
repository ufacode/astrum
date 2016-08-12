# frozen_string_literal: true
RSpec.describe LecturePolicy do
  subject { described_class }
  let(:guest) { FactoryGirl.create(:user) }
  let(:lecture) { FactoryGirl.create(:lecture) }
  let(:owner) { lecture.course.company.owner }

  permissions :create?, :new? do
    it 'nil user can`t create a new Lecture' do
      expect(subject).not_to permit(nil, Lecture.new)
    end

    it 'User can create a new Lecture' do
      expect(subject).to permit(FactoryGirl.create(:user), Lecture.new)
    end
  end
  #
  permissions :edit?, :update?, :destroy? do
    it 'access granted if is User is Owner' do
      expect(subject).to permit(owner, lecture)
    end

    it 'denied access if User is not Owner' do
      expect(subject).not_to permit(guest, lecture)
    end

    it 'denied access if User is nil' do
      expect(subject).not_to permit(nil, lecture)
    end
  end
end
