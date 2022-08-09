namespace :fake do
  desc "Fake some users"
  task users: :environment do
    raise "this can only run in development" unless Rails.env.development?

    DEFAULT_IMAGE_URL = "https://avatars.githubusercontent.com/u/77623418?s=200&v=4".freeze

    1000.times do |index|
      name = Faker::Name.name
      User.create!(
        github_id: Faker::Number.unique.number(digits: 10),
        nickname: "#{name.parameterize(separator: ".")}--#{Faker::Alphanumeric.alpha(number: 3)}",
        name:,
        image_url: DEFAULT_IMAGE_URL,
        admin: (index % 100).zero?
      )
    end
  end

  desc "Fake some batches"
  task batches: :environment do
    raise "this can only run in development" unless Rails.env.development?

    1000.times do
      Batch.create!(
        name: Faker::Number.unique.number(digits: 5),
        location: Faker::Address.city
      )
    end
  end

  desc "Fake batch memberships"
  task batch_memberships: :environment do
    Batch.eager_load(:memberships).find_each do |batch|
      next if batch.memberships.any?

      User.take(rand(8..15)).each do |user|
        batch.memberships.create!(user:)
      end

      batch.memberships.order("RANDOM()").limit(1).first.update(role: :owner)
    end
  end
end
