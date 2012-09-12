namespace :db do
  task bootstrap: :environment do
    require 'faker'

    40.times.each do |i|
      Foi.create! description: Faker::Lorem.paragraphs.join("\n"), org: Faker::Company.name, observation: Faker::Lorem.paragraphs.join("\n")
    end
  end
end



