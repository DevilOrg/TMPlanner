require 'bootstrap/helper'
require 'bootstrap/tag'
require 'bootstrap/input'
require 'bootstrap/input_group'

module Bootstrap
  class FormBuilder < ActionView::Helpers::FormBuilder

    include Bootstrap::Helper
    include Bootstrap::Tag
    include Bootstrap::Input
    include Bootstrap::InputGroup

  end
end
