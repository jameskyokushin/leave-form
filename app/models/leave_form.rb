class LeaveForm < ActiveRecord::Base

validates :category_request,  :presence => true
validates :reason_for_leave,  :presence => true
 
  STATUS_PENDING = 'PENDING'
  STATUS_APPROVED  = 'APPROVED'

 

   class << self
      def status_collection
       {
        "PENDING" => STATUS_PENDING,
        "APPROVED" => STATUS_APPROVED
       }
      end
   end
   def status_tag
        case self.status
          when STATUS_PENDING then :error
          when STATUS_APPROVED then :ok
        end
   end
end

