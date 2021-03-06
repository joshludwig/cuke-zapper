Before('@zap') do
  switches = Array.new
  switches << '--proxy-server=localhost:8080'
  Zap::new_session('MoT')
  @browser = Watir::Browser.new :chrome, switches: switches
  @browser.driver.manage.window.resize_to(1920, 1080)
end

After('@zap') do
  @browser.close
end
