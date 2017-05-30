class CreateTestDataOptions < ActiveRecord::Migration
  def change
    create_table :test_data_options do |t|
      t.belongs_to :test_data, index: true
      t.string :name
      t.boolean :high
      t.boolean :medium
      t.boolean :low

      t.timestamps
    end
  end
end
