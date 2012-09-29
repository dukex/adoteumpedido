namespace :db do
  task bootstrap: :environment do
    require 'ffaker'

    40.times.each do |i|
      Request.create! description: Faker::Lorem.paragraphs.join("\n"), observation: Faker::Lorem.paragraphs(1).join("\n"), resume: Faker::Lorem.paragraphs(1).join("\n")
      Comment.create! body: Faker::Lorem.paragraphs(1).join("\n\n"), request_id: Request.all.shuffle.last.id
    end
  end
end



