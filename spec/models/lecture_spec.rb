# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Lecture, type: :model do
  subject { FactoryGirl.build(:lecture) }

  context 'with validation' do
    it 'checks empty name' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].count).to be > 0
    end

    it 'check length of name' do
      subject.name = 'Astrum' * 100
      subject.valid?
      expect(subject.errors[:name].count).to be > 0
    end
  end

  context 'with relation' do
    it 'course not to be nil' do
      subject.course = nil
      subject.valid?
      expect(subject.errors[:course].count).to be > 0
    end
  end

  context 'with soft-delete' do
    it 'is a paranoid model' do
      expect(subject).to act_as_paranoid
    end
    it_behaves_like 'a Paranoid model'
  end
end
