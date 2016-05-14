# Disable <div class='field_with_errors'>...</div> content.
Rails.application.config.action_view.field_error_proc = Proc.new { |tag, resource| tag.html_safe }
