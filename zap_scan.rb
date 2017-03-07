require './features/support/lib/zap'
require 'JSON'
require 'rest-client'
require 'test_config'

Zap::load_session('MoT')
Zap::start_active_scan