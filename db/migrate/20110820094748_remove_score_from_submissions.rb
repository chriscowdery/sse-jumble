class RemoveScoreFromSubmissions < ActiveRecord::Migration
  def self.up
    remove_column :submissions, :score
  end

  def self.down
    add_column :submissions, :score, :integer
  end
end
