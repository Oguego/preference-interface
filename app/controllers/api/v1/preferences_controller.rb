class Api::V1::PreferencesController < Api::V1::BaseController
  def create
=begin
    device_id = params[:device_id]
    device = Device.find_by(device_id: device_id)
    test_data = params[:test_data]

    if (device)
      device.test_datas.destroy_all
      test_data.each do |data|
        new_test_data = TestData.new
        new_test_data.name = data[:name]
        new_test_data.device_id = device.id
        if new_test_data.save
          options = save_options(data[:options])
          options.each{ |e| new_test_data.test_data_optionses << e }
        end
      end
    else
      @device = Device.new
      @device.device_id = device_id

      if @device.save
        test_data.each do |data|
          new_test_data = TestData.new
          new_test_data.name = data[:name]
          new_test_data.device_id = @device.id
          if new_test_data.save
            options = save_options(data[:options])
            options.each{ |e| new_test_data.test_data_optionses << e }
          end
        end
        render :status=>200, :json=>{:status=>"success"}
      else
        render :status=>200, :json=>{:status=>"success"}
      end
    end
=end

    device_id = params[:device_id]
    device = Device.find_by(device_id: device_id)
    puts params
    if device
      user_preference = UserPreference.find_by(device_id: device.id)
      if user_preference
        if user_preference.update_attributes(Health: params['Health'] ? params['Health'] : user_preference.Health,
                                          Heating: params['Heating'] ? params['Heating'] : user_preference.Heating,
                                          Safety: params['Safety'] ? params['Safety'] : user_preference.Safety,
                                          Security: params['Security'] ? params['Security'] : user_preference.Security,
                                          Entertainment: params['Entertainment'] ? params['Entertainment'] : user_preference.Entertainment,
                                          Light: params['Light'] ? params['Light'] : user_preference.Light
        )
          render :status=>200, :json=>{:status=>"success"}
        end

      else
       user_preference =  UserPreference.new
        user_preference.Health = params['Health'] ? params['Health'] : nil
        user_preference.Heating = params['Heating'] ?  params['Heating'] :  nil
        user_preference.Safety = params['Safety'] ?  params['Safety'] : nil
        user_preference.Security = params['Security'] ?  params['Security']  : nil
        user_preference.Entertainment = params['Entertainment'] ?  params['Entertainment'] :  nil
        user_preference.Light = params['Light'] ?  params['Light'] : nil
        user_preference.device_id = device.id
        if user_preference.save
          render :status=>200, :json=>{:status=>"success"}
        end
      end
    else
      @device = Device.new
      @device.device_id = device_id

      if @device.save
        user_preference =  UserPreference.new
        user_preference.Health = params['Health'] ? params['Health'] : nil
        user_preference.Heating = params['Heating'] ?  params['Heating'] :  nil
        user_preference.Safety = params['Safety'] ?  params['Safety'] : nil
        user_preference.Security = params['Security'] ?  params['Security']  : nil
        user_preference.Entertainment = params['Entertainment'] ?  params['Entertainment'] :  nil
        user_preference.Light = params['Light'] ?  params['Light'] : nil
        user_preference.device_id = @device.id
        if user_preference.save
          render :status=>200, :json=>{:status=>"success"}
        end
      end
    end
  end

  private

  def save_options(options)
    entries = []
    options.each do |op|
      test_data_option = TestDataOptions.new
      test_data_option.name = op[:name]
      if test_data_option.name == 'High'
        test_data_option.high = true
        test_data_option.low = false
        test_data_option.medium = false
      end

      if test_data_option.name == 'Low'
        test_data_option.low = true
        test_data_option.medium = false
        test_data_option.high = false
      end

      if test_data_option.name = 'Medium'
        test_data_option.medium = true
        test_data_option.high = false
        test_data_option.low = false
      end

      entries.push(test_data_option)
    end
    entries
  end
end
