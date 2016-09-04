# frozen_string_literal: true
module ApplicationHelper
  def form_errors(form, _show_field = true)
    return '' unless form&.errors
    content_tag :div do
      content_tag :div, id: 'error_explanation' do
        content_tag :h2, "Found #{pluralize(form.errors.count, 'error')}"
      end
      content_tag :ul do
        form.errors.full_messages.each do |msg|
          concat(content_tag :li, msg)
        end
      end
    end
  end

  def blockable_form_tpl(blockable)
    klass = block_name(blockable)
    "domain/block/#{klass.pluralize}/form"
  end

  def blockable_show_tpl(blockable)
    klass = block_name(blockable)
    "domain/block/#{klass.pluralize}/#{klass}"
  end

  def block_controller_name(block)
    klass = block_name(block)
    "domain/block/#{klass.pluralize}"
  end

  private

  def block_name(blockable)
    blockable.class.to_s.split('::').last.downcase
  end
end
