class Link < ActiveRecord::Base
  belongs_to :user

  validates :url, :url => true, presence: true, uniqueness: true
  validates :title, presence: true
end
