HarmonyCms::Engine.routes.draw do

  get "check_geo_ip", to: "geo_ip#check_geo_ip"
  get "get_country_and_region", to: "geo_ip#get_country_and_region"
  get "email_submit", to: "email#submit"
  get 'ajax/validate_userid', to:'ajax#validate_userid'

end
