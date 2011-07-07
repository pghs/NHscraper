class CreateNotetakers < ActiveRecord::Migration
  def self.up
    create_table :notetakers do |t|
      t.string :n_id
      t.string :n_username
      t.string :n_url
      t.string :n_sales

      t.timestamps
    end
  end

  def self.down
    drop_table :notetakers
  end
end
