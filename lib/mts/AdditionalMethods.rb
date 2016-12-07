
class AdditionalMethods

  def msisdnverification(msisdn)
    msisdn.to_s
    beginnum = msisdn[0] + msisdn[1] + msisdn[2]
    beginnum1 = msisdn[0] + msisdn[1]
    if msisdn.length == 12 || msisdn.length==11 || msisdn.length == 13
        if msisdn[0]=='+'
          msisdn = msisdn.gsub!('+','')
          beginnum = msisdn[0] + msisdn[1] + msisdn[2]
          if beginnum == '375'
            return msisdn
          else return 1
          end
        else
          if beginnum == '375'
            return msisdn
          else
            if beginnum1 == '80' && msisdn.length ==11
              msisdn = '375' + msisdn[2]+msisdn[3]+msisdn[4]+msisdn[5]+msisdn[6]+msisdn[7]+msisdn[8]+msisdn[9]+msisdn[10]
              return msisdn
            else return 1
            end
          end
        end
      else return 1
    end
  end

def verify_msisdn(msisdn)
  msisdn1 = msisdn.gsub!('(','')
  msisdn2 = msisdn1.gsub!(')','')
  msisdn3 = msisdn2.gsub!('-','')
  msisdn4 = msisdn3.gsub!(' ','')
  msisdn5 = msisdn4.gsub!('+','')
  p msisdn5
  return msisdn5
end

  def remote_ip(env)
    remote_addr_list = env['REMOTE_ADDR'] && env['REMOTE_ADDR'].scan(/[^,\s]+/)

    unless remote_addr_list.blank?
      not_trusted_addrs = remote_addr_list.reject {|addr| addr =~ TRUSTED_PROXIES}
      return not_trusted_addrs.first unless not_trusted_addrs.empty?
    end
    remote_ips = env['HTTP_X_FORWARDED_FOR'] && env['HTTP_X_FORWARDED_FOR'].split(',')

    if env.include? 'HTTP_CLIENT_IP'
      if ActionController::Base.ip_spoofing_check && remote_ips && !remote_ips.include?(env['HTTP_CLIENT_IP'])
        # We don't know which came from the proxy, and which from the user
        raise ActionControllerError.new("IP spoofing attack?!\nHTTP_CLIENT_IP=\#{@env['HTTP_CLIENT_IP'].inspect}\nHTTP_X_FORWARDED_FOR=\#{@env['HTTP_X_FORWARDED_FOR'].inspect}\n")
      end

      return env['HTTP_CLIENT_IP']
    end

    if remote_ips
      while remote_ips.size > 1 && TRUSTED_PROXIES =~ remote_ips.last.strip
        remote_ips.pop
      end

      return remote_ips.last.strip
    end

    env['REMOTE_ADDR']
  end

end