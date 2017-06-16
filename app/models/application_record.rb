class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def all_error_messages
    errors = {}
    self.errors.messages.each do |attr, msg|
      errors["#{self.class.name.downcase}[#{attr}]"] = msg.first
    end
    self.class.reflect_on_all_associations.each do |assoc|
      send(assoc.name).each_with_index do |obj, i|
        obj.errors.messages.each do |attr, msg|
          errors["#{self.class.name.downcase}[#{assoc.name}_attributes][#{i}][#{attr}]"] = msg.first
        end
      end
    end
    errors
  end
end
