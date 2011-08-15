class CreatePeopleSubmissionsJoinTable < ActiveRecord::Migration
  def self.up
    create_table :people_submissions, :id => false do |t|
      t.integer :person_id
      t.integer :submission_id
    end
  end

  def self.down
    drop_table :people_submissions
  end
end
