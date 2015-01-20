require 'json'
require 'open-uri'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :use_point, :red, :green, :blue]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end
  
  def use_point
    used = @user.used_point + 1
    @user.update_column(:used_point, used)

    render 'show'
  end

  def red
    @user.update_column(:red, @user.red + 1)
    r = @user.red
    g = @user.green
    b = @user.blue
    rad = (60.0 * Math::PI/180.0)
    x = r + (-g * Math.cos(rad)) + ( -b * Math.cos(rad))
    y = 0.0 + g * Math.sin(rad) + ( -b * Math.sin(rad))
    @deg = Math.atan(y/x) * 180.0 / Math::PI

    render 'change_color'
  end

  def green
    @user.update_column(:green, @user.green + 1)
    r = @user.red
    g = @user.green
    b = @user.blue
    rad = (60.0 * Math::PI/180.0)
    x = r + (-g * Math.cos(rad)) + ( -b * Math.cos(rad))
    y = 0.0 + g * Math.sin(rad) + ( -b * Math.sin(rad))
    @deg = Math.atan(y/x) * 180.0 / Math::PI

    render 'change_color'
  end

  def blue
    @user.update_column(:blue, @user.blue + 1)
    r = @user.red
    g = @user.green
    b = @user.blue
    rad = (60.0 * Math::PI/180.0)
    x = r + (-g * Math.cos(rad)) + ( -b * Math.cos(rad))
    y = 0.0 + g * Math.sin(rad) + ( -b * Math.sin(rad))
    @deg = Math.atan(y/x) * 180.0 / Math::PI

    render 'change_color'
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.used_point = 0
    @user.red = 0
    @user.green = 0
    @user.blue = 0

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:github_id, :used_point)
    end
end
