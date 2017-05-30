class CreateUserPreferences < ActiveRecord::Migration
  def change
    create_table :user_preferences do |t|
      t.belongs_to :device, index: true
      t.string :Health
      t.string :Light
      t.string :Heating
      t.string :Safety
      t.string :Security
      t.string :Entertainment

      t.timestamps
    end
  end
end
