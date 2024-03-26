class ImageSerializer
    include Blueprinter::Definition
    identifier :id
  
    fields :url
  
    def url
      object.blob.url if object.attached?
    end
  end