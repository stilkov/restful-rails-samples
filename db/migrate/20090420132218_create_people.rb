class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first
      t.string :last
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
