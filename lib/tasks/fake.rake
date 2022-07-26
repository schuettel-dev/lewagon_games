namespace :fake do # rubocop:disable Metrics/BlockLength
  desc "Fake some users"
  task users: :environment do
    raise "this can only run in development" unless Rails.env.development?

    image_url = "https://avatars.githubusercontent.com/u/77623418?s=200&v=4"

    250.times do |_index|
      name = Faker::Name.name
      random_number = rand(1..50)
      privilege = if random_number == 1
                    "superadmin"
                  else
                    (random_number < 10) ? "admin" : "user"
                  end
      User.create!(
        github_id: Faker::Number.unique.number(digits: 10),
        nickname: "#{name.parameterize(separator: '.')}--#{Faker::Alphanumeric.alpha(number: 3)}",
        name:,
        image_url:,
        privilege:
      )
    end
  end

  desc "Fake some batches"
  task batches: :environment do
    raise "this can only run in development" unless Rails.env.development?

    250.times do
      Batch.create!(
        name: Faker::Number.unique.number(digits: 5),
        location: Faker::Address.city
      )
    end
  end

  desc "Fake batch memberships"
  task memberships: :environment do
    Batch.eager_load(:memberships).each do |batch|
      next if batch.memberships.any?

      User.order("RANDOM()").take(rand(8..15)).each do |user|
        batch.memberships.create!(user:)
      end

      batch.memberships.order("RANDOM()").limit(1).first.update(role: :owner)
    end
  end
end
