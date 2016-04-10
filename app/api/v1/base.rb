module V1
  class Base < Grape::API
    def self.inherited(subclass)
      super

      subclass.instance_eval do
        helpers Base::Auth
        helpers Base::CurrentResources
        helpers Base::Representation

        version "v1", using: :path

        format :json

        before { authenticate! }

        rescue_from ActiveRecord::RecordNotFound do |e|
          Rack::Response.new \
            [{ status: 404, status_code: "not_found", error: e.message }.to_json],
            404,
            { "Content-Type": "application/json" }
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          Rack::Response.new \
            [{ status: 403, status_code: "record_invalid", error: e.message }.to_json],
            403,
            { "Content-Type": "application/json" }
        end
      end
    end

    module Auth
      def authenticate!
        # TODO: Temporary disabled.
        # error! "Access denied: invalid or expired token.", 401 if current_user.blank?
      end
    end

    module CurrentResources
      def current_user
        # TODO: Find Current User By AccessToken (APIToken)
        # @current_user ||= User.find_or_initialize(params[:token])
      end
    end

    module Representation
      def permitted_params(options = {})
        declared(
          params, { include_missing: false }.merge(options)
        ).to_hash.with_indifferent_access
      end
    end
  end
end