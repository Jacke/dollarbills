# == Schema Information
#
# Table name: shift_row_assigns
#
#  id           :integer          not null, primary key
#  shift_row_id :integer
#  def          :integer
#  shift_id     :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class ShiftRowAssign < ActiveRecord::Base
  attr_accessible :shift_id, :shift_row_id, :def
  # Associations
	belongs_to :shift_row
	belongs_to :shift
  
end
