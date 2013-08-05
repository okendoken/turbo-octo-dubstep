class Message < ActiveRecord::Base
  belongs_to :want
  belongs_to :from, :class_name => 'User'
  belongs_to :to, :class_name => 'User'


  def self.create_message(text, user, want)
    receiver = want.user == user ? want.thing.user : want.user
    Message.create(:text => text, :from => user, :to => receiver, :want => want)
  end

  after_create :notify

  private
  def notify
    RelatedEvent.notify_all self, :created, self.from
  end
end
