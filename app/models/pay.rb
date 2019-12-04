class Pay < ApplicationRecord
  validates :basic, :presence => true
  validates :reimb, :presence => true
  validates :days, :presence => true
  validates :deduction, :presence => true
end
