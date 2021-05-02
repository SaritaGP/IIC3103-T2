class Api::V1::BaseController < Api::BaseController
  rescue_from("ActionController::ParameterMissing") do
    render json: nil, status: 400
  end
  before_action do
    self.namespace_for_serializer = ::Api::V1
  end
end
