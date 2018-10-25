class PostcodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    ukpc = UKPostcode.parse(value)

    unless ukpc.full_valid?
      record.errors[attribute] << 'is not recognised as a UK postcode'
    end
  end
end