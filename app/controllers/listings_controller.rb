class ListingsController < ApplicationController
	before_action :set_listing, only: [:show, :edit, :update, :destroy]

	# GET /listings
	def index
		@listings = Listing.all
	end

	# GET /listings/1
	def show
	end

	# GET /listings/new
	def new
		@listing = Listing.new
	end

	#GET /listings
	def edit
	end

	# POST /listings
	def create
		@listing = Listing.new(listing_params)

    respond_to do |format|
      if @listing.save
        format.html { redirect_to @listing, notice: 'Demo was successfully created.' }
        #format.json { render :show, status: :created, location: @demo }
      else
        format.html { render :new }
       # format.json { render json: @demo.errors, status: :unprocessable_entity }
      end
    end
	end

	# PATCH/PUT /listings/1
	def update
		@listing.update(listing_params)
		redirect_to @listing
	end

	# DELETE /listings/1
	def destroy
		@listing.destroy
	end

	private
		#Use callbacks to share common setup or constraints between actions
		def set_listing
			@listing = Listing.find(params[:id])
		end

		def listing_params
			params.require(:listing).permit(:user_id, :name, :address, :city, :country, :property, :bedroom, :bathroom, :max_people, :facilities, :price)
		end


end

