class Page < ActiveRecord::Base
  validates :name, presence: true, format: { with: /\A[a-zA-Z0-9_]+\z/ }
end
