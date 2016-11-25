require '../../../lib/mts/Database/DatabaseIntegration'


fg = DatabaseIntegration.new
a=fg.selectCodeVerification(375298766719)
puts a