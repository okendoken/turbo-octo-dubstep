module EventEnvironment
  #which guys should get notified when something happens
  EVENT_READERS = {
      :want => {
          :created => Proc.new{|want| [want.user]},
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

  NOTIFICATIONS_TEMPLATES = {
      :want => {
          :created => 'partials/notifications/project_or_task'
      },
      :message => {
          :sent => 10
      }
  }
end