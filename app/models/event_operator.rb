class EventOperator < ApplicationRecord
  self.primary_keys = :operator_id, :event_id
  belongs_to :operator
  belongs_to :event
  has_many :statuses, :class_name => 'EventOperatorStatus', :foreign_key => [:operator_id, :event_id]
end
