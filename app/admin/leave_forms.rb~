ActiveAdmin.register LeaveForm do
filter :employee_name
filter :department

 show :title => :employee_name do
    panel "Company Information" do
      attributes_table_for leave_form do
      row("Employee Name") { leave_form.employee_name }
      row("Department") { leave_form.department }
      row("Date Apply for Leave") { leave_form.date_request }
      row("Request") { leave_form.category_request }
      row("Reason") { leave_form.reason_for_leave }
      row("Start of Leave") { leave_form.begining_date_of_leave }
      row("End of Leave") { leave_form.ending_date_of_leave }
      row("Contact Number During Leave") { leave_form.phone_no_during_leave }
      row("Explanation") { simple_format leave_form.special_circumstance }
      end
    end
  end
  scope :all, :default => true

  scope :PENDING do |leaveforms|
    leaveforms.where(:status => LeaveForm::STATUS_PENDING)
  end

  scope :APPROVED do |leaveforms|
    leaveforms.where(:status => LeaveForm::STATUS_APPROVED)
  end

  action_item :only => :show do
    link_to "Approved", approved_leave_form_admin_leave_form_path(resource)
  end
  action_item :only => :show do
    link_to "Declined", declined_leave_form_admin_leave_form_path(resource)
  end
  
  member_action :declined_leave_form do
    @leaveform = LeaveForm.find(params[:id])
    @leaveform.status = LeaveForm::STATUS_DECLINED
    @leaveform.save
    
    redirect_to admin_leave_form_path(@leaveform), :notice => "Leave Declined"
  end

  member_action :approved_leave_form do
    @leaveform = LeaveForm.find(params[:id])
    @leaveform.status = LeaveForm::STATUS_APPROVED
    @leaveform.save
    
    redirect_to admin_leave_form_path(@leaveform), :notice => "Leave Approved Completed"
  end
 
 form do |f|
    f.inputs "Employee Information" do
      f.input :employee_name
      f.input :department
      f.input :date_request
      f.input :category_request, :collection => [["Unpaid","Unpaid"]], :wrapper_html => { :style => "display:none;" },:include_blank => false
      f.input :reason_for_leave, :collection => [["Vacation / Personal Leave","Vacation / Personal Leave"],["Ill family Member","Ill family Member"],["Employee's Own Illness", "Employee's Own Illness"],["Care for new child", "Care for new child"]], :as => :radio, :label => " Reason for Leave ", :include_blank => false
    end
    f.inputs "Leave Date" do
      f.input :begining_date_of_leave, :label => "Date Begin"
      f.input :ending_date_of_leave, :label => "Date End"
      f.input :phone_no_during_leave, :input_html => { :style => "width: 120px"}, :label => "Contact Number"
      f.input :special_circumstance, :input_html => { :rows => 4 }, :label => "Special Circumstance (Explain)"
      f.input :status, :collection => LeaveForm.status_collection, :include_blank => false, :wrapper_html => { :style => "display:none;" }
    end
   f.buttons
  end
  index do
     column :created_at |leaveform|
  
     column :status do |leaveform|
      status_tag leaveform.status, leaveform.status_tag
    end
     column :employee_name
     column :begining_date_of_leave #do |leaveform|
      #due = if leaveform.ending_date_of_leave
      #  " ( #{distance_of_time_in_words Time.now, leaveform.ending_date_of_leave} before leave)"
      #else
      #  ""
      #end
      
      #"#{l leaveform.begining_date_of_leave, :format => :short}" + due
    #end
     column :ending_date_of_leave
     column do |leaveform|
      link_to("Details", admin_leave_form_path(leaveform)) + " | " + \
      link_to("Delete", admin_leave_form_path(leaveform), :method => :delete, :confirm => "Are you sure?")
    end
  end
end
