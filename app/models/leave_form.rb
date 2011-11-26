class LeaveForm < ActiveRecord::Base

validates :category_request,  :presence => true
validates :reason_for_leave,  :presence => true
 
  STATUS_PENDING = 'PENDING'
  STATUS_APPROVED  = 'APPROVED'
  STATUS_DECLINED  = 'DECLINED'
  

 

   class << self
      def status_collection
       {
        "PENDING" => STATUS_PENDING,
        "APPROVED" => STATUS_APPROVED,
        "DECLINED" => STATUS_DECLINED
       }
      end
   end
   def status_tag
        case self.status
          when STATUS_PENDING then :warning
          when STATUS_DECLINED then :error
          when STATUS_APPROVED then :ok
        end
   end
end

