class AddMagicStringToSubmissions < ActiveRecord::Migration
  def self.up
    add_column :submissions, :magic_string, :string
  end

  def self.down
    remove_column :submissions, :magic_string
  end
end
