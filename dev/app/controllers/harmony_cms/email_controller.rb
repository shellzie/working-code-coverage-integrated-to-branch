module HarmonyCms
  class EmailController < ActionController::Base

  	def submit
  		
  		logger.debug "EMAIL"

		ri = "X0Gzc2X%3DWQpglLjHJlTQGkYyH6ze9lzc7wzgm0pp1u8S9cUoy3T4IpvzeCXhVwjpnpgHlpgneHmgJoXX0Gzc2X%3DWQpglLjHJlTQGomYjijiRSi617zbpEGMKeIYUoy3T4IpvzeCXh"
		unescaped_ri = URI.unescape(ri)
		email_address = params['email']
		source_id = 'IntPay'
		url = "https://e.intuit.com/pub/rf?_ri_=#{unescaped_ri}&SOURCE_ID=#{source_id}&EMAIL_ADDRESS_=#{email_address}"
		
	    begin
          code,msg,body,hdrs = ShowroomPlugin::call_api(url, 'GET')
          if code == 200
            Rails.logger.debug "Default Internal encoding: #{Encoding.default_internal}"
            _process_response(body.encode('UTF-8', {:invalid => :replace, :undef => :replace}))
          else
            raise "Status code other than 200 i.e #{code} received from API end point #{url}"
          end
        rescue Exception => ex
          Rails.logger.error "Error while getting the feed data at #{url}. Message: #{ex.message}"
          {}
        end

        render :text => "email submitted"

    end

  end
end