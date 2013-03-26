class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end	


class User < ActiveRecord::Base
    attr_accessible :firstname, :lastname, :dateofbirth, :location ,:address,:email, :primaryphoneno, :secondaryphoneno, :name, :age
	  
	
	
	validates :firstname, :presence =>true,
						:length => {:minimum => 5}
	validates :lastname, :presence =>true, :length =>{ :minimum =>3 }  
	validates :dateofbirth, :presence =>true 
	validate :date_of_birth_validation 		
	validates :location, :presence =>true ,:format => { :with => /\A[a-zA-Z]+\z/,:message => "Only letters allowed" }
	validates :address, :presence =>true	
	validates :email, :presence => true, :email => true
	validates :primaryphoneno, :presence =>true ,:length => { :is =>10 }, :numericality => { :only_integer => true }
	validates :secondaryphoneno, :presence =>true ,:length => { :is =>10 }, :numericality => { :only_integer => true }	

	before_save :update_name
	before_save :update_age
	
			
			
	  
	def date_of_birth_validation
	    if self.dateofbirth.future?
			errors.add(:dateofbirth,"you hava enterd future date")
		elsif  self.dateofbirth  > Date.today - 10.years
			errors.add(:dateofbirth, "Date should be below 10 years to current date")			
		end
	end	
	
	def update_name
		self.name = self.firstname + ' ' + self.lastname
		
	end
	def update_age
		now = Date.today
		self.age = now.year - self.dateofbirth.year
	end
	
end




