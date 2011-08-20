class CreateLetters < ActiveRecord::Migration
  def self.up
    create_table :letters do |t|
      t.string :letter
      t.integer :score

      t.timestamps
    end
  end

  def self.down
    drop_table :letters
  end
end
