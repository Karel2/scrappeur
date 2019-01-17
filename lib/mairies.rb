	require 'open-uri'
	require 'nokogiri'

def access_url	

	townhall_name = []
	doc = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

	doc.css('tr > td > p > a > @href').each do |node|
		townhall_name << 'http://annuaire-des-mairies.com' + node.text
	end

	townhall_name.each_index do |town| 
		townhall_name[town][31] = ''  #suppression du point qui est à la 31eme position
	end	

return townhall_name

end


def get_town_email(access_url)

	townhall_email = []
	town_name = []

	access_url.each do |case_array|
		Nokogiri::HTML(open("#{case_array}")).xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |node|
			townhall_email << node.text
		end
	end

	Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")).css('tr > td > p > a').each do |node|
		town_name << node.text
	end
	
	hash_name_url = town_name.zip(townhall_email).to_h
	
	return hash_name_url
end	
	
def perform
	get_town_email(access_url)
end	