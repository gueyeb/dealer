module Images
  class Create
    attr_reader :vehicle, :image_attrs

    def initialize(vehicle, image_attrs)
      @vehicle = vehicle
      @image_attrs = image_attrs
    end

    def call
      direct_upload_url = CGI.unescape(image_attrs[:direct_upload_url])
      image_attrs.merge!(Images::GetUploadAttrs.new(direct_upload_url).call)
      image = @vehicle.images.create! image_attrs
      ImageProcessingJob.perform_later image
      image
    end
  end
end
