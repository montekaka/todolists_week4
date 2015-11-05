class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_name_or_last_name_both_null, :gender_either_male_or_female, :male_can_not_have_first_name_sue

  def first_name_or_last_name_both_null
  	if first_name.nil? && last_name.nil?
  		errors.add(:first_name, "and last name can not both be null")
  	end
  end

  def gender_either_male_or_female
  	if ['male','female'].include?(gender) == false
  		errors.add(:gender, "to be either male or female")
  	end
  end

  def male_can_not_have_first_name_sue
  	if gender == 'male' && first_name == "Sue"
  		errors.add(:gender, "can not have the first name Sue")
  	end
  end

  def self.get_all_profiles(min_dob, max_dob)
    self.where("birth_year BETWEEN :min_dob AND :max_dob", min_dob: min_dob, max_dob: max_dob).order(birth_year: :asc)
  end
end
