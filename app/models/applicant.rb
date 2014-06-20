class Applicant < ActiveRecord::Base

  has_many :relationships

  has_one :identity, -> { where kind: "identity" }, dependent: :destroy, source: :person, through: :relationships
  has_many :landlords, -> { where kind: "landlord" }, dependent: :destroy, source: :person, through: :relationships
  has_many :household_members, -> { where kind: "household_member" }, dependent: :destroy, source: :person, through: :relationships

  accepts_nested_attributes_for :identity
  accepts_nested_attributes_for :landlords, allow_destroy: true
  accepts_nested_attributes_for :household_members, allow_destroy: true

  belongs_to :user
  attr_accessible :identity_attributes, :landlords_attributes, :household_members_attributes

  def preferred_attrs_for field_names
    field_names.map do |field_name|
      begin
        preferred_items field_name
      rescue Dragoman::NoMatchError
        nil
      end
    end.flatten.reject(&:nil?).to_set
  end

  def description
    identity.description
  end

  def field field_name
    value_for_field(field_name).to_s
  end

  def delegate_field_to item, field_name
    item && item.value_for_field(field_name) || ""
  end

  def value_for_field field_name
    case field_name
    when /^HH(\d+)(.*)$/
      index = $1.to_i - 1
      delegate_field_to household_members[index], $2
    when /^LL(\d+)(.*)$/
      index = $1.to_i - 1
      delegate_field_to landlords[index], $2
    when "Today"
      Date.today
    when "Now"
      now = Time.now
      "%d:%d" % [now.hour, now.sec]
    else
      identity.value_for_field(field_name)
    end
  end

end
