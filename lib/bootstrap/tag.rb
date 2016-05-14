module Bootstrap
  module Tag

    delegate :content_tag, to: :@template

    def form_group(method, *args)
      options = args.extract_options!

      html = { class: group_class(method) }

      content_tag :div, html do
        input_group method, options
      end
    end

    def label(method, options)
      super method, options[:label], class: 'control-label'
    end

    def message(content)
      content_tag :span, content, class: 'help-block'
    end

  end
end
