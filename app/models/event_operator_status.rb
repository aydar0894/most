class EventOperatorStatus < ActiveRecord::Base
  belongs_to :event_operators, :foreign_key => [:event_id, :operator_id]
end
