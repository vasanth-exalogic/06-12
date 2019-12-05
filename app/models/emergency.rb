class Emergency < ApplicationRecord
  validates :ename, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/}
end
