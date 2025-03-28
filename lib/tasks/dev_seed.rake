# lib/tasks/dev.rake
namespace :dev do
  desc "Populate the database with development data"
  task populate: :environment do
    # Ensure we're in development
    raise "This task can only be run in development" unless Rails.env.development?

    # Start a transaction to make the entire process atomic
    ActiveRecord::Base.transaction do
      # Clear existing data
      puts "Clearing existing data..."
      Win.destroy_all
      User.destroy_all

      # Create predictable test users
      test_users = [
        {
          email_address: "user1@example.com",
          password: "password123",
          first_name: "John",
          last_name: "Doe"
        },
        {
          email_address: "user2@example.com",
          password: "password123",
          first_name: "Jane",
          last_name: "Smith"
        }
      ]

      # Create test users
      created_users = test_users.map do |user_data|
        user = User.create!(
          email_address: user_data[:email_address],
          password: user_data[:password]
        )

        # Update user profile if needed
        user.user_profile.update(first_name: user_data[:first_name]) if user.user_profile

        user
      end

      # Generate additional random users
      5.times do
        user = User.create!(
          email_address: Faker::Internet.unique.email,
          password: "password123"
        )
      end

      # Generate wins for these users
      User.all.each do |user|
        rand(1..5).times do
          Win.create!(
            user: user,
            title: [
              "Successful #{Faker::Company.industry} Project",
              "Achieved #{Faker::Verb.base} Goal",
              "Outstanding Performance in #{Faker::Job.field}",
              "Breakthrough Initiative"
            ].sample,
            description: Faker::Lorem.paragraph(sentence_count: rand(1..8)),
            impact: Faker::Lorem.paragraph(sentence_count: rand(1..3)),
            achievement_date: Faker::Date.between(from: 2.years.ago, to: Date.today),
            private_notes: Faker::Lorem.paragraph(sentence_count: 1)
          )
        end
      end

      puts "Created #{User.count} users"
      puts "Created #{Win.count} wins"
    end
  end

  desc "Remove all development data"
  task clear: :environment do
    # Ensure we're in development
    raise "This task can only be run in development" unless Rails.env.development?

    # Clear data
    puts "Clearing development data..."
    Win.destroy_all
    User.destroy_all
    puts "All development data has been removed."
  end
end
