# frozen_string_literal: true
module ApplicationHelper
  def form_errors(form, _show_field = true)
    html = []
    if form && form.errors.any?
      html << %(<div id="error_explanation"><h2>#{pluralize(form.errors.count, 'error')} prohibited this lecture from being saved:</h2><ul>)
      form.errors.full_messages.each do |msg|
        html << %(<li>#{msg}</li>)
      end
      html << '</ul></div>'
    end
    html.join.html_safe
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
