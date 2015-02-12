module Images
  class Create
    attr_reader :vehicle, :image_attrs

    def initialize(vehicle, image_attrs)
      @vehicle, @image_attrs = vehicle, image_attrs
    end

    def call
      image = @vehicle.images.create! image_attrs
      ImageProcessingJob.perform_later image
      image
    end

  end
end