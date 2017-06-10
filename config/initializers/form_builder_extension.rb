class ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Context

  def amount_field(method, options={})
    options[:class] = add_class(options, 'input-group-field')
    content_tag :div, class: 'input-group' do
      content_tag(:span, options[:currency].html_safe || '$', class: 'input-group-label') +
      number_field(method, options)
    end.html_safe
  end

  def text_area_with_hint(method, options={})
    raise 'Provide hint in options' if options[:hint].blank?
    (text_area(method, options) + content_tag(:p, options[:hint], class: 'help-text')).html_safe
  end

  def array_field(method, options={})
    if self.object.send(method).blank?
      build_array_field(method, options)
    else
      self.object.send(method).map do |val|
        opts = options.merge(value: val)
        build_array_field(method, opts)
      end.join
    end.html_safe
  end

  def link_to_add_array_field(text, options={})
    link_to text, 'javascript:void(0)', class: add_class(options, 'button clone-array-field')
  end

  private

  def add_class(opts, class_name)
    (classes = opts[:class] || '').concat(classes.is_a?(Array) ? [class_name] : " #{class_name}")
  end

  def build_array_field(method, options)
    options.merge!(multiple: true)
    options[:class] = add_class(options, 'input-group-field')
    content_tag :div, class: 'input-group' do
      text_field(method, options) +
      content_tag(:div, class: 'input-group-button') do
        link_to '&times'.html_safe, 'javascript:void(0)', class: 'button alert delete-array-field'
      end
    end
  end
end
