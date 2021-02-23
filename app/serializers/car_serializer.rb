# rubocop:disable Naming/MethodName
class CarSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :color, :model, :bodyStyle, :pricePerDay, :doors, :luggages, :seats, :emissionsClass, :transmission,
             :engine, :rentDeposit, :carImg
  def carImg
    url_for(object.carImg)
  end
end

# rubocop:enable Naming/MethodName
