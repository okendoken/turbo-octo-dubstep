class RelatedEvent < ActiveRecord::Base
  include EventEnvironment

  belongs_to :readable, :polymorphic => true
  belongs_to :reader, :polymorphic => true
  belongs_to :user
  belongs_to :event

  validates :e_type, :presence => true

  def self.notify_all(readable, type, user)
    clazz = readable.class.name.downcase.to_sym
    RelatedEvent.transaction do
      event = Event.create!(:e_type => DB_EVENT_TYPES[clazz][type], :user => user)
      EVENT_READERS[clazz][type].call(readable).each do |reader|
        RelatedEvent.create!(:e_type => DB_EVENT_TYPES[clazz][type], :read => false,
                             :readable => readable, :reader => reader, :user => user,
                             :event => event)
      end
    end
  end

  def notification_template
    clazz = self.readable.class.name.downcase.to_sym
    NOTIFICATION_TEMPLATES[clazz][DB_EVENT_TYPES[clazz].key(self.e_type)]
  end
end
