class Thing < ActiveRecord::Base
  belongs_to :user
  has_many :wants

  def is_given?
    self.given ? 'Yes' : 'Nope'
  end
end
