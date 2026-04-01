RailsAdmin.config do |config|
  config.asset_source = :importmap

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin_user
  end
  config.current_user_method(&:current_admin_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

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

  config.included_models = [
    "Post",
    "Project",
    "Category",
    "Tag",
    "Profile",
    "SocialLink",
    "Experience",
    "Skill",
    "ProjectLink",
    "ProjectVisual",
    "ProjectMetric",
    "ProjectAchievement",
    "ContactMessage"
  ]

  config.model "Post" do
    edit do
      field :title
      field :slug
      field :excerpt
      field :content, :text
      field :category
      field :tags
      field :status
      field :featured
      field :published_at
      field :meta_title
      field :meta_description
    end
  end

  config.model "Project" do
    edit do
      field :title
      field :slug
      field :summary
      field :challenge
      field :solution
      field :status
      field :featured
      field :published_at
      field :meta_title
      field :meta_description
      field :project_links
      field :project_visuals
      field :project_metrics
      field :project_achievements
    end
  end
end
