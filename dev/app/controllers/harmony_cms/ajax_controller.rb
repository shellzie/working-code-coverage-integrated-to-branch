module HarmonyCms
  class InvalidUserId < StandardError; end;
  class AjaxController < ActionController::Base

    MESSAGE_VALIDATE_USER_ID_TAKEN = 'This User Id is already taken. Please enter a different User Id.'
    MESSAGE_VALIDATE_USER_ID_INCORRECT = 'Please enter a valid User ID: 4 characters or more, at least one letter, no spaces or tabs. You may also use numbers, periods, underscores, dashes, and @ signs.'

    def validate_userid
      response = ''
      userid = request.GET.values[0]

      raise InvalidUserId if userid.size < 4

      code,msg,body,hdrs = ShowroomPlugin::call_api(File.join('https:' << HarmonyCms::uid_validation_url, 'start', 'userid_available'), 'POST', {}, {
        'userName'=> userid,
        'pwd'=> ''
      }.to_query)

      if(body.include?('LoginExists'))
        response = MESSAGE_VALIDATE_USER_ID_TAKEN
      end
    rescue InvalidUserId => ex
      response = MESSAGE_VALIDATE_USER_ID_INCORRECT
    rescue Exception => ex
      Rails.logger.error 'Error during HarmonyCms::AjaxController::validate_userid', ex
    ensure
      render :json => {
        message: response
      }
    end
  end
end