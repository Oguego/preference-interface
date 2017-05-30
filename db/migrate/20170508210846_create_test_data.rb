class CreateTestData < ActiveRecord::Migration
  def change
    create_table :test_data do |t|
      t.belongs_to :device, index: true
      t.string :name

      t.timestamps
    end
  end
end
