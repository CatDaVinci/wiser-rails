class Api::V1::ApplicationController < ApplicationController
  def render_success(object = {}, status = :ok, options = {})
    render options.merge({:json => object, :status => status})
  end

  def render_errors(object, status = :bad_request, options = {})
    render options.merge({:json => {:errors => object}, :status => status})
  end
end
