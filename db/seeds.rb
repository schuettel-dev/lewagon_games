["lxxxvi"].each do |github_nickname|
  params = ActionController::Parameters.new(admin_user: { github_nickname: })
  Admin::AddGithubUserForm.new(User.new, params).save
end
