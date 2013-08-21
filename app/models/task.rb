class Task < ActiveRecord::Base
	belongs_to :user

	validate :not_exist_starting, :on => :update

	def not_exist_starting

		if status == 1
			 errors.add(:status, "Can't save")  if Task.where( :user_id => user_id, :status => 1 ).any?
		end

	end


	def update_status new_status

  		if new_status == "start" && self.status == 0 #start task

  				self.status = 1
  				self.start_time = Time.current
  				self.save

  		else 

  			if self.status == 1

  				self.status = 2
  				self.complete_time = Time.current
  				self.save

  			end

  		end
	end


end
