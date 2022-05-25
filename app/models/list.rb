class List < ApplicationRecord
  after_initialize :generate_code
  validates :code, uniqueness: true

  private
    def generate_code
      self.code ||= rand(36**4).to_s(36).upcase
    end
end
