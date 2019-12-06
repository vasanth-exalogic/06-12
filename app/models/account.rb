class Account < ApplicationRecord
  validates :accname, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: "Only Alphabets are allowed"}
  validates :accno, format: {with: /\A\d+\z/, message: "Only Numbers are allowed"}
  validates :bank, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: "Only Alphabets are allowed"}
  validates :branch, format: {with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: "Only Alphabets are allowed"}
end
