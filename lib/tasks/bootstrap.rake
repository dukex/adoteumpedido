namespace :db do
  task bootstrap: :environment do
    require 'ffaker'

    authority = Authority.create! url_name: FFaker::Lorem.words(1).first

    40.times.each do |i|
      Request.create! description: FFaker::Lorem.paragraphs(2).join("\n"),
                      observation: FFaker::Lorem.paragraphs(1).join("\n"),
                      resume: FFaker::Lorem.words(2).join(' '),
                      authority_id: authority.id

      Comment.create! body: FFaker::Lorem.paragraphs(1).join("\n\n"),
                      request_id: Request.all.shuffle.last.id
    end

    AdminUser.create! email: 'admin@admin.com',
                      password: 'abc12345',
                      password_confirmation: 'abc12345'
  end
end



