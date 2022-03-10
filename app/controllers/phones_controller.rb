class PhonesController < ApplicationController

	#skip_before_filter :verify_authenticity_token

  def index
  	if number_alloted?
  		allot_number new_number
  	else
  		allot_number phone_params
  	end
	end

	private

	def number_alloted?
		Phone.where(number: phone_params).present?
	end

	def phone_params
		params.permit(:phone)
	end

	def allot_number(number)
		Phone.create(number: number)
	end

	def new_number
		([*1111111111..9999999999] - Phone.pluck(:number)).sample
	end
end