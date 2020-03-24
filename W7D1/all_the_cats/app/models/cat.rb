class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    validates :birthdate, presence: true
    validates :name, presence: true
    validates :color, presence: true, inclusion: {in: %w(brown white black mixed orange gray rainbow blue),
        message: "%{value} could at least be rainbow" }
    validates :sex, presence: true, inclusion: {in: %w(M F R),
        message: "we don't support all-inclusive cats. Minus rainbow cats" }
    
    def age
        year = Date.today.year - self.birthdate.year
        # month = Date.today.month - self.
        # from stack overflow
        # now = Time.now.utc.to_date
        # now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    end

end
