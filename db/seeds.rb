[
  {
    provider: "github",
    uid: "1409672",
    nickname: "lxxxvi",
    name: "Mario",
    image_url: "https://avatars.githubusercontent.com/u/1409672?v=4",
    admin: true
  }
].each do |hash|
  provider, uid = hash.values_at(:provider, :uid)

  User.find_or_initialize_by(provider:, uid:).tap do |user|
    user.assign_attributes(hash.without(:provider, :uid))
    user.save!
  end
end
