class Want < ActiveRecord::Base
  belongs_to :thing
  belongs_to :user
  has_many :messages

  before_create :init


  def self.create_want(thing, user, text)
    want = thing.wants.create(:user => user)
    Message.create(:text => text, :from => user, :to => thing.user, :want => want)
    RelatedEvent.notify_all want, :created, user
  end

  def init
    self.accepted = false if self.accepted.nil?
    self.finished = false if self.finished.nil?
  end

  def finish
    ActiveRecord::Base.transaction do
      self.thing.wants.each do |want|
        unless want == self
          want.accepted = false
          want.finished = true
          want.save
        end
      end
      self.accepted = true
      self.finished = true
      self.save
      self.thing.given = true
      self.thing.save
    end
  end
end
