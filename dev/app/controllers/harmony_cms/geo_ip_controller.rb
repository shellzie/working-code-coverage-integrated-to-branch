include ShowroomPlugin::GeoApi

module HarmonyCms
  class GeoIpController < ActionController::Base

    def check_geo_ip
      #Rails.logger.debug "bbb params #{params.inspect}"
      client_ip = self.get_geo_ip_client_ip_address
      country_code = self.get_geo_ip_country_code(client_ip)
      redirect_key, redirect_url = self.get_geo_ip_redirect_value(country_code)

      return render(:json => {country_code:"#{country_code}", client_ip:"#{client_ip}",
                              redirect_key:"#{redirect_key}", redirect_url:"#{redirect_url}"
      })
    end

    def get_country_and_region
      client_ip = self.get_geo_ip_client_ip_address
      country_code, region_code, region_name = self.get_geo_ip_details(client_ip)
      redirect_key, redirect_url = self.get_geo_ip_redirect_value(country_code)

      return render(:json => {country_code:"#{country_code}", region_code: "#{region_code}", region_name:"#{region_name}", client_ip:"#{client_ip}",
                              redirect_key:"#{redirect_key}", redirect_url:"#{redirect_url}"
      })
    end

    #private
    def get_geo_ip_client_ip_address
      client_ip = params['force_ip']
      if (client_ip.blank?)
        forwarded_ip = request.env.has_key?('HTTP_X_FORWARDED_FOR') ? request.env['HTTP_X_FORWARDED_FOR'] : ''
        ## when there are multiple ips in forwarded_ip, get the first ip
        #Rails.logger.debug "bbbbbbbbb ajax forwarded_ip=#{forwarded_ip}"
        unless forwarded_ip.blank?
          forwarded_ip = forwarded_ip.split(/,/)[0].sub!(/^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}).*/, '\1')
        end
        client_ip = (forwarded_ip.blank?) ? request.remote_ip : forwarded_ip
      end
      #Rails.logger.debug "bbbbbbbbb ajax client_ip=#{client_ip}"

      return client_ip
    end

    def get_geo_ip_details(client_ip)
      # check country code from cookie
      country_code = params['country_code']
      region_code = params['region_code']
      region_name = params['region_name']

      if ( country_code.blank? || region_code.blank? || region_name.blank? )
        country_code, region_code, region_name = nil
        valid_ip = true if client_ip =~ /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/

        if (valid_ip && client_ip)
          geo_ip_details = ShowroomPlugin::GeoApi.lookup_country_code(client_ip, true)
          if (geo_ip_details[:code].eql?(200))
            country_code = geo_ip_details[:body]["countryCode"]
            region_code = geo_ip_details[:body]["region"]
            region_name = geo_ip_details[:body]["regionName"]
          end
        end

      end
      return [country_code, region_code, region_name]

    end

    def get_geo_ip_country_code(client_ip)
      # check country code from cookie
      country_code = params['country_code']

      if (country_code.blank?)
        country_code = nil
        valid_ip = true if client_ip =~ /^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$/

        if (valid_ip && client_ip)
          country_code_hash = ShowroomPlugin::GeoApi.lookup_country_code(client_ip)
          #Rails.logger.debug "bbb country_code_hash= #{country_code_hash.inspect}"
          if (country_code_hash[:code] == 200)
            country_code = country_code_hash[:body]["countryCode"]
          end
        end
      end

      return country_code
    end

    def get_geo_ip_redirect_key
      if (params['force_url'])
        redirect_key = params['force_url']
      elsif (params['force_ip'])
        # for simplicity, when there is force_ip param for testing purpose, use host value as redirect_key
        redirect_key = request.host
      else
        if (request.referer)
          uri = URI.parse(request.referer)
          if (uri)
            redirect_key = uri.host
            redirect_key += '?' + uri.query if uri.query
          end
        end
      end

      if (! redirect_key)
        redirect_key = request.host
      end
      #Rails.logger.debug "bbbbbbbbbb redirect_key=#{redirect_key}"

      return redirect_key
    end

    def get_geo_ip_redirect_value(country_code)
      if (country_code && (country_code != 'US'))
        redirect_key = self.get_geo_ip_redirect_key

        # check and get redirect_url from yml file, input country_code and page_url
        # redirect_file = GEO_IP_CONFIG
        # rf_hash = YAML.load_file(redirect_file)
        if (HarmonyCms::GEO_IP_LOOKUP && HarmonyCms::GEO_IP_LOOKUP["#{country_code}"] && HarmonyCms::GEO_IP_LOOKUP["#{country_code}"]["#{redirect_key}"])
          redirect_url = HarmonyCms::GEO_IP_LOOKUP["#{country_code}"] && HarmonyCms::GEO_IP_LOOKUP["#{country_code}"]["#{redirect_key}"]
        end
        #Rails.logger.debug "XXXXXX country_code=#{country_code}, redirect_key=#{redirect_key}, redirect_url=#{redirect_url}"

        return [redirect_key, redirect_url]
      end
    end

  end
end
