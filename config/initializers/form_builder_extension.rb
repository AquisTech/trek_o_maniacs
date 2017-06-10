class ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  def amount_field(method, options={})
    classes = options[:class] || ''
    classes.concat(classes.is_a?(Array) ? ['input-group-field'] : ' input-group-field')
    options[:class] = classes
    content_tag :div, class: 'input-group' do
      content_tag(:span, options[:currency].html_safe || '$', class: 'input-group-label') +
      number_field(method, options)
    end.html_safe
  end

  def text_area_with_hint(method, options={})
    raise 'Provide hint in options' if options[:hint].blank?
    (text_area(method, options) + content_tag(:p, options[:hint], class: 'help-text')).html_safe
  end
end
