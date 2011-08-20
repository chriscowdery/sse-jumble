class AddScoreToWords < ActiveRecord::Migration
  def self.up
    add_column :words, :score, :integer
  end

  def self.down
    remove_column :words, :score
  end
end
