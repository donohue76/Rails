class PasswordController < ApplicationController
  def checker
    @user_name = params[:user_name].to_s
    @password = params[:password].to_s
      # Tells user what the result is.
    if (params.has_key?(:user_name) && !params[:user_name].strip.empty?) &&(params.has_key?(:password) && !params[:password].strip.empty?)
      cookies[:user_name] = params[:user_name]
      cookies[:password] = params[:password]

      if @user_name == @password
        @same_string = flash.now[:alert] = "User ID and password cannot be the same"
      end
      if @user_name.length < 6
        @long_user_name_string = flash.now[:alert] = "User ID must be 6 characters or longer"
      end
      if @password.length < 6
        @long_password_string = flash.now[:alert] = "Password must be at least 6 characters long"
      end
      # if @user_name.length < 6 && @password.length < 6
      #   @long_string = flash.now[:alert] = "User ID and Password must be 6 characters or longer"
      # end
      # elsif @user_name.length < 6 && @password.length >=6
      #   @long_string = flash.now[:alert] = "UserID must be 6 characters or longer"
      # elsif  @user_name.length >= 6 && @password.length < 6
      #   @long_string = flash.now[:alert] = "Password must be 6 characters or longer"
      # end
      if @user_name.include?("!") || @user_name.include?("#") || @user_name.include?("$")
        @not_contain_string = flash.now[:alert] = "User ID cannot contain these special characters: !$#"
      end
      if !@password.include?("!") && !@password.include?("#") && !@password.include?("$")
        @contains_string = flash.now[:alert] = "Password must contain at least one of these special characters: !$#"
      end
      if @same_string.nil? && @long_user_name_string.nil? && @long_password_string.nil? && @not_contain_string.nil? && @contains_string.nil?
        @valid_string = flash.now[:alert] = "User ID and password are valid"
      end
      # if @same_string.nil? && @long_user_name_string.nil? && @not_contain_string.nil?
      #   @valid_user_name_string = flash.now[:alert] = "Username is valid"
      # end
      # if @same_string.nil? && @long_password_string.nil? && @contains_string.nil?
      #   @valid_password_string = flash.now[:alert] = "Password is valid"
      # end
      # if !@valid_user_name_string.nil? && !@valid_password_string.nil?
      #   @valid_string = flash.now[:alert] = "Username and Password are valid"
      # end
    end
    render "checker.html.erb"
  end



  # def same(userID, password)
  #   if userID != password
  #     puts true
  #   end
  # end
  #
  #
  #
  # def longEnough(userID, password)
  #   if userID.length >= 6 && password.length >= 6
  #     puts "true"
  #   elsif userID.length < 6 && password.length < 6
  #     puts "false"
  #   elsif userID.length < 6 && password.length >= 6
  #     puts "userID false"
  #   elsif userID.length >= 6 && password.length < 6
  #     puts "password false"
  #   end
  # end
  #
  #
  # def doesNotContainSpecial(userID)
  #   if !userID.include?("!") && !userID.include?("#") && !userID.include?("$")
  #     puts true
  #   end
  # end
  #
  #
  #
  # def containsSpecial(password)
  #   if password.include?("!") || password.include?("$") || password.include?("#")
  #     puts true
  #   end
  # end
end
