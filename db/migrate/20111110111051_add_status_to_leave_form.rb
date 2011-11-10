class AddStatusToLeaveForm < ActiveRecord::Migration
  def self.up
    add_column :leave_forms, :status, :string
  end

  def self.down
    remove_column :leave_forms, :status
  end
end
