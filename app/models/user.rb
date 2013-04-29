class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :articles
  
  scope :with_capability, lambda { |capability| {:conditions => "capabilities_mask & #{2**CAPABILITIES.index(capability.to_s)} > 0 "} }

  CAPABILITIES = %w[manage_articles write_articles]

  def capabilities=(capability)
    self.capabilities_mask = (capability & CAPABILITIES).map { |r| 2**CAPABILITIES.index(r) }.sum
  end

  def capabilities
    CAPABILITIES.reject { |r| ((capabilities_mask || 0) & 2**CAPABILITIES.index(r)).zero? }
  end

  def has_capability?(capability)
    capabilities.include? capability.to_s
  end

  def teacher_id
    puts "mail blank #{self.email.blank?}"
    unless self.email.blank?
      @teacher = Teacher.where(email: self.email).first
      @teacher.id if @teacher
    end
  end

end
