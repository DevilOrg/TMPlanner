module Crm
  class BaseController < ApplicationController

    layout 'crm'

    before_action :require_login

  end
end
