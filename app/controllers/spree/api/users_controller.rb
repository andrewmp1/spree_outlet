UsersController.class_eval do
  # TODO: FIXME
  # Add alternative login method other than spree_user/sign_in
  def login
    authenticate_spree_user!

    if spree_user_signed_in?
      render json: spree_current_user, :status => 200 and return
    else
      render "spree/api/errors/not_found", :status => 404 and return
    end
  end

  # Override standard create that only allows admins to create a user
  # Automated user creations no bueno?
  def create
    @user = Spree.user_class.new(params[:user])
    if @user.save
      respond_with(@user, :status => 201, :default_template => :show)
    else
      invalid_resource!(@user)
    end
  end
end