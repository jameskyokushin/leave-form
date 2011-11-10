class CreateLeaveForms < ActiveRecord::Migration
  def self.up
    create_table :leave_forms do |t|
      t.string :employee_name
      t.string :department
      t.date :date_request
      t.string :category_request
      t.string :reason_for_leave
      t.datetime :begining_date_of_leave
      t.datetime :ending_date_of_leave
      t.string :phone_no_during_leave
      t.text :special_circumstance

      t.timestamps
    end
  end

  def self.down
    drop_table :leave_forms
  end
end
