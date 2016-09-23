
class AdditionalMethods

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