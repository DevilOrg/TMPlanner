class Dev::BaseController < ApplicationController
  layout 'dev'
  before_action :require_login
end
