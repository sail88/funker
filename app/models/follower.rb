class Follower < ActiveRecord::Base
	belongs_to :user

	def are_you_following(user)
		@target = user
		@you = self
		@your_follows = Follower.find(where {follower: @you.id})
		

	end
end
