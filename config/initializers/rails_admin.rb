RailsAdmin.config do |config|

  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin == true
  end

  config.current_user_method(&:current_user)

  config.model 'User' do
    list do
      field :name
      field :points
      field :username
      field :email
      field :DOB
      field :county
      field :password
      field :password_confirmation
      field :admin
    end

    edit do 
      configure :password do
        hide
      end
      configure :password_confirmation do 
        hide
      end
    end

  end


  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
