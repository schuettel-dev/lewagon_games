namespace :fake do
  desc "Fake some users"
  task users: :environment do
    raise "this can only run in development" unless Rails.env.development?

    DEFAULT_IMAGE_URL = "https://avatars.githubusercontent.com/u/77623418?s=200&v=4".freeze

    1000.times do
      name = Faker::Name.name
      User.create!(
        provider: :github,
        uid: Faker::Number.unique.number(digits: 10),
        nickname: "#{name.parameterize(separator: ".")}--#{Faker::Alphanumeric.alpha(number: 3)}",
        name:,
        image_url: DEFAULT_IMAGE_URL,
        admin: false
      )
    end
  end
end
