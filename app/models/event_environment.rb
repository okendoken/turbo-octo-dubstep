module EventEnvironment
  #which guys should get notified when something happens
  EVENT_READERS = {
      :want => {
          :created => Proc.new{|want| [want.thing.user]},
          :finished => Proc.new{|want| [want.user]}
      },
      :message => {
          :created => Proc.new{|message| [message.to]}
      }
  }

  DB_EVENT_TYPES = {
      :want => {
          :created => 0, :finished => 1
      },
      :message => {
          :created => 10
      }
  }

  NOTIFICATION_TEMPLATES = {
      :want => {
          :created => 'notifications/partials/want',
          :finished => 'notifications/partials/want_finished'
      },
      :message => {
          :created => 'notifications/partials/message_sent'
      }
  }
end