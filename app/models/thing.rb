class Thing < ActiveRecord::Base
  belongs_to :user

  def is_given?
    self.given ? 'Yes' : 'Nope'
  end
end
