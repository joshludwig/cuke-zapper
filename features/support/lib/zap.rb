module Zap
  def self.new_session(name)
    session_name = File.expand_path('zap') + "/#{name}"
    RestClient.get "http://localhost:8080/JSON/core/action/newSession/?zapapiformat=JSON&apikey=#{TestConfig.api_key}&name=#{URI.escape(session_name)}&overwrite=true"
    session_name
  end

  def self.load_session(name)
    session_name = File.expand_path('zap') + "/#{name}"
    RestClient.get "http://localhost:8080/JSON/core/action/loadSession/?zapapiformat=JSON&apikey=#{TestConfig.api_key}&name=#{URI.escape(session_name)}"
    session_name
  end

  def self.start_active_scan
    RestClient.get "http://localhost:8080/JSON/ascan/action/scan/?zapapiformat=JSON&apikey=#{TestConfig.api_key}&url=http%3A%2F%2Fhackyourselffirst.troyhunt.com&&recurse=&scanPolicyName=&method=&postData="
    poll_status
  end

  def self.poll_status
    scan_status = 0
    while scan_status < 100
      scan_results = RestClient.get "http://localhost:8080/JSON/ascan/view/status/?zapapiformat=JSON&scanId=0"
      scan_results = JSON.parse scan_results
      scan_status = scan_results['status'].to_i
      sleep 3
    end
  end

  def self.import_context(context_file_name)
    RestClient.get "http://localhost:8080/JSON/context/action/importContext/?zapapiformat=JSON&apikey=97js3itrped1p8nreinvf6q7oc&contextFile=#{context_file_name}"
  end

  private_class_method :poll_status
end
