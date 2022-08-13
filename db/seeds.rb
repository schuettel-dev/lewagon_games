["lxxxvi"].each do |github_nickname|
  params = ActionController::Parameters.new(user: { github_nickname: })
  Users::Form.new(User.new, params).save
end
