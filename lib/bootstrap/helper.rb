##
# Application helpers
#------------------------------------------------------------------------------
module ApplicationHelper

  def bootstrap_form_for(resource, options = {}, &block)
    options = {
      builder: Bootstrap::FormBuilder
    }.merge options

    form_for resource, options, &block
  end

end

##
# Bootstrap helpers
#------------------------------------------------------------------------------
module Bootstrap
  module Helper

    delegate :errors, to: :@object

    def error?(method)
      errors[method].present?
    end

    def group_class(method)
      ['form-group', ('has-error' if error? method)].join ' '
    end

  end
end
