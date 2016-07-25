class UsersController < Clearance::UsersController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

	def show
		#@user = User.find(params[:id])
	end

	def edit 
		#@user = User.find(params[:id])
	end


	def update
		#@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to @user
	end

	def destroy
		@user.destroy
	end

	# # PATCH/PUT /users/1
	# # PATCH/PUT /users/1.json
	# def update
	# 	#@user = User.find(params[:id])
	# 	respond_to do |format|
	# 		if @user.update(user_params)
	# 			format.html { redirect_to @user, notice: 'User succesfully updated.' }
	# 			format.json { render :show, status: :ok, location: @user }
	# 		else
	# 			format.html { render :edit }
	# 			format.json { render json: @user.errors, status: :unprocessable_entity }
	# 		end
	# 	end
	# end

	# # DELETE /users/1
	# # DELETE /users/1.json
	# def destroy
	# 	@user.destroy
	# 	respond_to do |format|
	# 		format.html { redirect_to users_url, notice: 'User was succesfully destroyed.' }
	# 		format.json { head :no_content }
	# 	end
	# end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
	 	@user = User.find(params[:id])
	end

    def user_from_params
      name = user_params.delete(:name)
      email = user_params.delete(:email)
      password = user_params.delete(:password)

      Clearance.configuration.user_model.new(user_params).tap do |user|
        user.name = name
        user.email = email
        user.password = password
      end
    end

	#Never trust parameters from the scary internet, only allow the white list through.
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end
end