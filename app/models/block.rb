# frozen_string_literal: true
class Block < ApplicationRecord
  acts_as_list scope: :lecture

  belongs_to :lecture
  belongs_to :blockable, polymorphic: true, dependent: :destroy
end

# == Schema Information
#
# Table name: blocks
#
#  blockable_id   :integer
#  blockable_type :string(255)
#  created_at     :datetime         not null
#  id             :integer          not null, primary key
#  lecture_id     :integer
#  name           :string(255)
#  position       :integer
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_blocks_on_blockable_type_and_blockable_id  (blockable_type,blockable_id)
#  index_blocks_on_lecture_id                       (lecture_id)
#
