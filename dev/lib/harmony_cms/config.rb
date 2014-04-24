module HarmonyCms
  module Config

    attr_accessor :qbo_url, :uid_validation_url, :ga_account_number, :lp_account_number, :sc_account_qb, :optimizely_acc_number, :ensighten_path, :ensighten_bootstrap, :pr_toolmap, :pr_data_layer

    def configure
      yield self
    end

    def qbo_url
      @qbo_url ||= "http://quickbooksonline.intuit.com"
    end
  end
end
