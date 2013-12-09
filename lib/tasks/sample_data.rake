namespace :db do
    desc "Fill database with sample data"

    task populate: :environment do
        User.create!(name: "majie",
                    email: "majieqq@gmail.com",
                    password: "852845",
                    password_confirmation: "852845",
                    admin: true)
        99.times do |n|
            name = Faker::Name.name
            email = "example-#{n+1}@railstutorial.org"
            password = "password"
            User.create!(name: name,
                        email: email,
                        password: password,
                        password_confirmation: password)
        end
    end
end
