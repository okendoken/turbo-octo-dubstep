module EventEnvironment
  #which guys should get notified when something happens
  EVENT_READERS = {
      :want => {
          :created => Proc.new{|want| [want.thing.user]},
          :finished => Proc.new{|want| [want.user]}
      },
      :message => {
          :sent => Proc.new{|message| [message.to]}
      }
  }

  DB_EVENT_TYPES = {
      :want => {
          :created => 0, :finished => 1
      },
      :message => {
          :sent => 10
      }
  }

  NOTIFICATION_TEMPLATES = {
      :want => {
          :created => 'notifications/partials/want'
      },
      :message => {
          :sent => 10
      }
  }
end