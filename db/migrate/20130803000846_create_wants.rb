class CreateWants < ActiveRecord::Migration
  def change
    create_table :wants do |t|
      t.references :thing, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
