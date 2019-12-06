class Pay < ApplicationRecord
  validates_uniqueness_of :pay_id
end
