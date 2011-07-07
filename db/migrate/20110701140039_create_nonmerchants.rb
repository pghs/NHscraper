class CreateNonmerchants < ActiveRecord::Migration
  def self.up
    create_table :nonmerchants do |t|
      t.integer :n_id

      t.timestamps
    end
  end

  def self.down
    drop_table :nonmerchants
  end
end
