# frozen_string_literal: true
RSpec.describe CoursePolicy do
  subject { described_class }
  let(:guest) { FactoryGirl.create(:user) }
  let(:course) { FactoryGirl.create(:course) }
  let(:owner) { course.company.owner }

  permissions :create?, :new? do
    it 'nil user can`t create a new Course' do
      expect(subject).not_to permit(nil, Course.new)
    end

    it 'User can create a new Course' do
      expect(subject).to permit(FactoryGirl.create(:user), Course.new)
    end
  end
  #
  permissions :edit?, :update?, :destroy? do
    it 'access granted if is User is Owner' do
      expect(subject).to permit(owner, course)
    end

    it 'denied access if User is not Owner' do
      expect(subject).not_to permit(guest, course)
    end

    it 'denied access if User is nil' do
      expect(subject).not_to permit(nil, course)
    end
  end
end
