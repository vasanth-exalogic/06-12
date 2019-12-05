class Detail < ApplicationRecord
  validates :fname, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
  validates :lname, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
  validates :gender, presence: true
end
