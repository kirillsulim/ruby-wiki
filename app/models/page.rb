class Page < ActiveRecord::Base
  # I named this full_name because path is already defined in ancestry gem
  validates :full_name, presence: true, format: { with: /\A[a-zA-Z0-9_]+(\/[a-zA-Z0-9_]+)*\z/ }
  validates :name, presence: true, format: { with: /\A[a-zA-Z0-9_]+\z/ }
  has_ancestry
end
