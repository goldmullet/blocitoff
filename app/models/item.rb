class Item < ActiveRecord::Base
  belongs_to :list

  default_scope { order('updated_at ASC') }

  validates :list, presence: true
  validates :name, length: {minimum: 5}, presence: true
end
