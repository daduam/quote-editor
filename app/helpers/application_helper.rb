# frozen_string_literal: true

module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend 'flash', partial: 'layouts/flash'
  end

  def form_error_notification(object)
    if object.errors.any?
      tag.div class: 'error-message' do
        object.errors.full_messages.to_sentence.capitalize
      end
    end
  end

  def nested_dom_id(*args)
    dom_ids = args.map do |arg|
      arg.respond_to?(:to_key) ? dom_id(arg) : arg
    end
    dom_ids.join('_')
  end
end
