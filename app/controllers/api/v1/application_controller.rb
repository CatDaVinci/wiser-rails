class Api::V1::ApplicationController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def default_serializer_options
    {root: false}
  end

  def render_success(object = {}, status = :ok, options = {})
    if object.respond_to?(:total_entries)
      headers['X-Pagination'] = {
        current_page: object.current_page,
        per_page: object.per_page,
        total_pages: object.total_pages
      }.to_json
    end
    render options.merge({:json => object, :status => status})
  end

  def render_errors(object, status = :bad_request, options = {})
    render options.merge({:json => {:errors => object}, :status => status})
  end
end
