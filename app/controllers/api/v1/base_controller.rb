class Api::V1::BaseController < Api::BaseController
  rescue_from("ActionController::ParameterMissing") do
    render json: nil, status: 400
  end
  rescue_from "ActiveRecord::RecordInvalid" do |exception|
    render json: exception.record, status: :conflict
  end

  rescue_from "ActiveRecord::RecordNotFound" do 
    render json: nil, status: 422
  end


  before_action do
    self.namespace_for_serializer = ::Api::V1
  end
end
