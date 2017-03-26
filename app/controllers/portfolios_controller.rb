class PortfoliosController < ApplicationController
	# before action, goes through and calls set blog method for the following methods inside the brackets
  	before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  	layout "portfolio"

  # petergate gem config - related to our user.rb
  access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :edit]}, site_admin: :all
  	
	def index
		# check portfolio model for custom scopes
		# ".by_position" is the custome scope made in the portfolio model
		@portfolio_items = Portfolio.by_position
	end

	# a controller action by default is going to go look for a view
	# we don't want that - we just want to do something with the sorted cards
	def sort
		params[:order].each do |key, value|
			Portfolio.find(value[:id]).update(position: value[:position])
		end

		# bypass traditional rails process to look for views
		head :ok
	end

	def show
  end

	# custom scope example 
	def angular
		@angular_portfolio_items = Portfolio.angular
	end

	# create new method that makes a new Portfolio
	# here is where we generated our form elements
	def new
		@portfolio_item = Portfolio.new

		# build is going to instantiate 3 versions of this portfolio item with technologies
		3.times { @portfolio_item.technologies.build }
	end

	def create
    @portfolio_item = Portfolio.new(portfolio_params)

    respond_to do |format|
		if @portfolio_item.save
			format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
			format.json { render :show, status: :created, location: @portfolio_item }
		else
			format.html { render :new }
			format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
		end
  	end
	end

	# grab the id
	def edit
	end

	def update
  	respond_to do |format|
		if @portfolio_item.update(portfolio_params)
			format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
			format.json { render :show, status: :ok, location: @portfolio_item }
		else
			format.html { render :edit }
			format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
		end
  	end
 	end

 	# no need to create a destroy template
 	def destroy
 		@portfolio_item.destroy

 		# needs to redirect after destroying
	    respond_to do |format|
	      format.html { redirect_to portfolios_path, notice: 'Record was removed.' }
	      format.json { head :no_content }
	    end
 	end

	private 
		def set_portfolio
    		@portfolio_item = Portfolio.find(params[:id])
  	end

  	# update params to show the nested attributes, then go to our portfolio views and update teh new form
  	def portfolio_params
      params.require(:portfolio).permit(:title, :subtitle, :body, technologies_attributes: [:name])
    end
end
