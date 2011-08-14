class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  # def index
  #   @users = User.all
  # 
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.xml  { render :xml => @users }
  #   end
  # end

  # POST /login
  def login
    unless user = User.find_by_email(params[:email])
      redirect_to root_url, :notice => User::EMAIL_UNREGISTERED
      return
    end
    if user.authenticate(params[:password]) #TODO Normalization
      reset_session
      session[:id] = user.id
      unless user.lists.empty?
        redirect_to lists_url, :notice => "Your berry harvest was successful. Let's make jam."
      else
        redirect_to new_list_url, :notice => "Please make a list."
      end
    else
      redirect_to root_url, :notice => User::PASSWORD_INVALID
    end
  end

  def logout
    reset_session
    redirect_to root_url
  end

  # GET /users/1
  # GET /users/1.xml
  # def show
  #   @user = User.find(params[:id])
  # 
  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.xml  { render :xml => @user }
  #   end
  # end

  # GET /users/new
  # GET /users/new.xml
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  # def edit
  #   @user = User.find(params[:id])
  # end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(root_url, :notice => 'Thanks for joining!  Try signing in.') }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  # def update
  #   @user = User.find(params[:id])
  # 
  #   respond_to do |format|
  #     if @user.update_attributes(params[:user])
  #       format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
  #       format.xml  { head :ok }
  #     else
  #       format.html { render :action => "edit" }
  #       format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /users/1
  # DELETE /users/1.xml
  # def destroy
  #   @user = User.find(params[:id])
  #   @user.destroy
  # 
  #   respond_to do |format|
  #     format.html { redirect_to(users_url) }
  #     format.xml  { head :ok }
  #   end
  # end
end
