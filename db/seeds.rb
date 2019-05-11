# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Language_names = ["Chinese", "English", "Spanish", "Hindi", "Italian", "Korean", "Portuguese", "Japanese", "Arabic", "Russian", "French", "German"]

if Language.count == 0
    Language_names.each do |name|
        Language.create(name: name)
        puts "#{name} created"
    end
end

if User.count == 0
    for i in 1..100
        User.create(
            first_name: Faker::Name.first_name,
            last_name: Faker::Name.last_name,
            date_of_birth: Faker::Date.birthday(18, 65),
            role: rand(2),
            gender: rand(2),
            email: Faker::Internet.email,
            password: "password",
            city: "Sydney",
            biography: Faker::Lorem.paragraph,
        ).language_ids = [rand(1..12)]
        puts "#{i} created"
    end
end

User.all.each do |user|
    if user.role == "teacher"

        lesson = Lesson.new(
            user_id: user.id,
            language_id: user.languages.ids[0],
            body: Faker::Lorem.paragraph,
            lesson_date: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today),
            lesson_time: "18:00:00",
            street: "20 Bond Street",
            city: "Sydney",
            state: "NSW",
            country: "Australia",
            postcode: "2000",
            price: 10,
            max_students: rand(10..25),
            difficulty: rand(3)
        )

        lesson.save(validate: false)
        puts "#{user.first_name} created a lesson"
    end
end
