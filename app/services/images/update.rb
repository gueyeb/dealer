module Images
  class Update
    attr_reader :image, :attrs

    def initialize(image, attrs)
      @image = image
      @attrs = attrs
    end

    def call
      image.processed = false
      direct_upload_url = attrs[:direct_upload_url].present? ? CGI.unescape(attrs[:direct_upload_url]) : image.direct_upload_url
      attrs.merge!(Images::GetUploadAttrs.new(direct_upload_url).call)
      image.attributes = attrs
      image.save!
      ImageProcessingJob.perform_later image
      image
    end
  end
end
