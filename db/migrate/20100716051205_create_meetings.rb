class CreateMeetings < ActiveRecord::Migration
  def self.up
    create_table :meetings do |t|
      t.date :meeting_date
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :meetings
  end
end
