require "active_model"

class OneOfManyValidator < ActiveModel::Validator
  def validate(record)
    present_fields = fields.reject { |field| record.attributes[field].blank? }

    record.errors.add(:base, error_type) if present_fields.blank?
  end

  private
  def error_type
    (fields.map(&:to_s).join('_and_') + '_blank').to_sym
  end

  def fields
    options[:fields]
  end
end
