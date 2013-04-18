namespace :db do
  desc "Get authorities from alaveteli"
  task import_authorities_from_alaveteli: [:environment] do
    authorities = File.open("#{Rails.root}/db/data/all-authorities.csv").read.split("\n")
    headers = authorities.delete_at(0).split(",")

    name_index = headers.find_index("Name")
    url_name_index = headers.find_index("URL name")

    authorities.each do |authority|
      authority_info = authority.split(",")
      name = authority_info[name_index]
      url_name = authority_info[url_name_index]
      next if url_name == "body"
      next if url_name.nil? or name.nil?
      next if name.gsub(/\W/, '').empty? or url_name.gsub(/\W/, '').empty?
      puts "saving #{name} with url: #{url_name}"
      Authority.create! name: name, url_name: url_name
    end
  end
end
