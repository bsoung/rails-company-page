class PortfoliosController < ApplicationController
	# before action, goes through and calls set blog method for the following methods inside the brackets
  	before_action :set_portfolio, only: [:show, :edit, :update]


	def index
		@portfolio_items = Portfolio.all
	end

	def show
  	end

	# create new method that makes a new Portfolio
	def new
		@portfolio_item = Portfolio.new
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

  	private 
  		def set_portfolio
      		@portfolio_item = Portfolio.find(params[:id])
    	end

	  	def portfolio_params
	      params.require(:portfolio).permit(:title, :subtitle, :body)
	    end
end