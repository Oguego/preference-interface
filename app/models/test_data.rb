class TestData < ActiveRecord::Base
  belongs_to :device
  has_many :test_data_optionses, dependent: :destroy
end
