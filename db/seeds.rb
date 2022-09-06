["lxxxvi"].each do |github_nickname|
  params = ActionController::Parameters.new(user: { github_nickname: })
  Users::Form.new(User.new, params).save
  User.find_by(nickname: github_nickname).privilege_superadmin!
end

GameType.find_or_initialize_by(instance_type: "Game::Beatle").tap do |game|
  game.name = "Beatle"
  game.description = "Guess who's behind a playlist of 3 songs"
  game.save!
end
