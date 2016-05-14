module Bootstrap
  module InputGroup

    delegate :safe_join, :capture, to: :@template

    private

    def input_group(method, options)
      case options[:input]
        when :email
          base_group method, options do email_field method end
      end
    end

    def base_group(method, options = {}, &block)
      content = []

      content.push label method, options

      content.push capture &block

      if options[:hint].present?
        content.push message options[:hint]
      end

      if error?(method)
        content.push message errors[method].first
      end

      safe_join content
    end

  end
end
