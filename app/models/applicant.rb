class Applicant < ActiveRecord::Base
  
  def self.table_search(table, entry)
  if table and entry
  @applicants = where table+' LIKE ?',"%"+entry+"%"
  else
  @applicants = all
  end

  end
  
	def self.search(search)
		if search
			where('name LIKE ? or nationality LIKE ? or dob LIKE ? or gender LIKE ? or disability LIKE ? 
				or status LIKE ? or mobileNo LIKE ? or education LIKE ? or currentJob LIKE ?', "%#{search}%","%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
		else
			all
		end
	end
  
  belongs_to :country

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  has_attached_file :cv, styles: { medium: "300x300>", thumb: "100x100>" }
  has_attached_file :membership, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image,:cv, :membership,  content_type: /\Aimage\/.*\Z/
  
  

  validates :name, :disability,  presence: true
  
  
  def self.getage(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
  
  before_save do
    self.disability.gsub!(/[\[\]\"]/, "") if attribute_present?("disability")
  end


GENDER_LIST = ["ذكر", "أنثى"]

STATUS_LIST = ["أعزب", "متزوج", "مطلق"]

EDUCATION_LIST = ["لا يهم","إبتدائي","إعدادي","ثانوي","دبلوم","بكالوريوس","ماجستير","دكتوراة"]

#def validate!
#	errors.add(:name, "cannot be nil") if name.nil?
#end

end
