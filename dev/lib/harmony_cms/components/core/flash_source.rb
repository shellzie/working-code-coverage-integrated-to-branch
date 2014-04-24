module HarmonyCms
  module Components::Core
    class FlashSource < ShowroomCms::Component

    	attr_reader :file_resource

    	def initialize(file_resource)
	      @file_resource = file_resource
	    end

	    def src
	      @src ||= _src
	    end

	    def _src
        return '' if file_resource.blank?
	      file_extension = File.extname(file_resource)
	      file_name = File.basename(file_resource, file_extension)
	      file_dir = File.dirname(file_resource)
	      flash_uuid, flash_metadata = ShowroomCms.cache.fetch "#{file_resource}" do
	        [uuid_from_cq, metadata_from_cq]
	      end
	      Rails.logger.debug ( "UUID: #{flash_uuid} and metadata: #{flash_metadata}")

	      uniq_file_name = flash_uuid.blank? ? "#{file_name}#{file_extension}" : "#{file_name}_#{flash_uuid}#{file_extension}"
	      File.join(file_dir, uniq_file_name)
	    end

	    def delete_image_uuid_from_cache
	      ShowroomCms.cache.delete(file_resource)
	    end

	    def uuid_from_cq
	      begin
	        cq_flash_uri = File.join(file_resource, "jcr:content", "renditions", "original", "jcr:content")
	        ShowroomCms::CqConnector.retrieve_json(cq_flash_uri)["jcr:uuid"]
	      rescue Exception => ex
	        Rails.logger.warn "could not find the uuid for the image #{file_resource}. Error: #{ex.message}"
	        nil
	      end
	    end

	    def metadata_from_cq
	      begin
	        cq_flash_metadata_url = File.join(file_resource, "jcr:content", "metadata")
	        ShowroomCms::CqConnector.retrieve_json(cq_flash_metadata_url)
	      rescue Exception => ex
	        Rails.logger.warn "could not find the uuid for the image #{file_resource}. Error: #{ex.message}"
	        nil
	      end
	    end
    end
	end
end