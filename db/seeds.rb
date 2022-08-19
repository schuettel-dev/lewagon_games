["lxxxvi"].each do |github_nickname|
  params = ActionController::Parameters.new(user: { github_nickname: })
  Users::Form.new(User.new, params).save
  User.find_by(nickname: github_nickname).privilege_superadmin!
end

Game.find_or_create_by(klass: "Game::MySongs") do |game|
  game.name = "My Songs"
end
