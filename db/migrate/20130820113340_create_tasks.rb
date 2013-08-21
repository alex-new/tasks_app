class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.integer :user_id,  :null => false
      t.string :name,  :null => false
      t.integer :status,  :null => false, :default => 0


      t.datetime :start_time
      t.datetime :complete_time

    end

  end
end
