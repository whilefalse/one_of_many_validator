require 'ostruct'
require 'one_of_many_validator'

class TestModel
  include ActiveModel::Validations

  attr_accessor :attributes

  validates_with OneOfManyValidator, :fields => [:field_one, :field_two, :field_three]

  def initialize(attributes)
    @attributes = attributes
  end
end

describe OneOfManyValidator do
  describe "Validation" do
    context "when all fields are not blank" do
      it "is valid" do
        record = TestModel.new(:field_one => 'foo', :field_two => 'bar', :field_three => 'baz')

        record.valid?

        record.errors.should be_blank
      end
    end

    context "when some fields are given and some blank" do
      it "is valid" do
        record = TestModel.new(:field_one => 'foo', :field_two => 'bar', :field_three => '')

        record.valid?

        record.errors.should be_blank
      end
    end

    context "when all fields are blank" do
      it "is invalid" do
        record = TestModel.new(:field_one => '', :field_two => '')

        record.valid?

        record.errors.should_not be_blank
        record.errors[:base].should include I18n.t('activemodel.errors.models.test_model.attributes.base.field_one_and_field_two_and_field_three_blank')
      end
    end
  end
end
