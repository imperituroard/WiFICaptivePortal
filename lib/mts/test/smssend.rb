require 'rubygems'
require 'smpp'
require '../../../lib/mts/SMSC/sms_samplegateway'
require '../../../config/Parameters/params'
require '../../../lib/mts/SMSC/KeyboardHandler'

SampleGateway.send_mt('MTS.WiFI', 375298766719, 'body')