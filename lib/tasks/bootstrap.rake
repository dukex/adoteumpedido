namespace :db do
  task bootstrap: :environment do
    require 'ffaker'

    authority = Authority.create!

    40.times.each do |i|
      Request.create! description: Faker::Lorem.paragraphs(2).join("\n"), observation: Faker::Lorem.paragraphs(1).join("\n"), resume: Faker::Lorem.words(2).join(' '), authority_id: authority.id
      Comment.create! body: Faker::Lorem.paragraphs(1).join("\n\n"), request_id: Request.all.shuffle.last.id
    end

    # AdminUser.create!(:email => 'admin@admin.com', :password => 'abc123', :password_confirmation => 'abc123')
  end
end



