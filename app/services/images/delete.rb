module Images
  class Delete
    attr_reader :image

    def initialize(image)
      @image = image
    end

    def call
      # delete attachment (and let Paperclip do its job)
      image.image = nil
      image.save!

      # delete the object
      image.destroy!
    end
  end
end
