class AddFieldsToWants < ActiveRecord::Migration
  def change
    change_table :wants do |t|
      t.boolean :finished
      t.boolean :accepted
    end
  end
end
