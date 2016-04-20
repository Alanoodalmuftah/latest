class AddEmployedToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :employed, :boolean, :default => false
  end
end
