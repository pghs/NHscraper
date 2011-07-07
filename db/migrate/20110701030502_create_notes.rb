class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.integer :notetaker_id
      t.string :title
      t.string :type
      t.integer :pages
      t.string :rating
      t.string :listed

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
