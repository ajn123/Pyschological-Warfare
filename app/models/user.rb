class User < ApplicationRecord
	 validates_format_of :email, :with => /@/
	 validates_uniqueness_of :email
end
