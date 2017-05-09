#require_relative '../factory/dojo/dojo_creator.rb'

class DojosController < ApplicationController
	before_action :authorize

	def new
		@dojo = Dojo.new
	end

    DojoFactories = {
      kata: DojoFactory::KataCreator,
      randori: DojoFactory::RandoriCreator
    }
	def create

	    dojoFactories = DojoFactories[params[:dojo][:category].to_sym]
		if (dojoFactories)
			@dojo = dojoFactories.create(dojo_params, current_user)
		end

		if @dojo.save
			# Ok
			redirect_to @dojo
		else
			# TODO: Error saving the dojo
			raise "Error"
		end

	end

	def show
		@dojo = Dojo.find(params[:id])
		if (@dojo)
			@category = @dojo.categorizable.class.name

			# renders dojos_kata_show, dojos_randori_show
			viewToRender = @category.tr('::', '').underscore + '_show'
			render viewToRender
		else
			# Dojo not found

		end

	end

	def edit

	end

	def update
	end

	def destroy
	end

	private
	def dojo_params
		params.require(:dojo).permit(:user_id, :title)
	end
end
