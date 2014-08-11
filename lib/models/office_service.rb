class OfficeService
  def self.find_by_name name
    consultants = Consultant.where(home_office: name)
    Office.new consultants
  end
end
