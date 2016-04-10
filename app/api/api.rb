class API < Grape::API
  prefix :api
  default_format :json
  error_formatter :json, ErrorFormatter

  mount V1::Hello
end