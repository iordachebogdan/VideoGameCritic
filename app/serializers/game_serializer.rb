class GameSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :description, :created_at, :image_url
  has_one :platform, serializer: PlatformSerializer
  has_one :category, serializer: CategorySerializer

  def image_url
    if (object.image.attached?)
      rails_blob_path(object.image, only_path: true)
    else
      ""
    end
  end
end
