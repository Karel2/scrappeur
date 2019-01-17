require 'open-uri'
require 'nokogiri'

def access_url	

	townhall_name = []
	doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))

	doc.css('div.clearfix > ul > li > a > @href').each do |node|
		townhall_name << 'http://www2.assemblee-nationale.fr' + node.text
	end
=begin	
	townhall_name.each_index do |town| 
		townhall_name[town][31] = ''  #suppression du point qui est à la 31eme position
	end	
=end

return townhall_name

end

def get_town_email(access_url)

	townhall_email = []
	town_name = []
	mavar = access_url[250..-250]
	print "b"
	mavar.each do |case_array|
		Nokogiri::HTML(open("#{case_array}")).xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[1]/a/@href').each do |node|
			townhall_email << node.text
			print "e"
		end
	end

	print "a"

	Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")).xpath('//*[@id="deputes-list"]/div[1]/ul[1]/li[1]/a').each do |node|
		town_name << node.text
	end
	
	hash_name_url = town_name.zip(townhall_email).to_h

	puts hash_name_url
end	

get_town_email(access_url)
	
=begin
def perform
	print get_town_email(access_url)
end	

perform
=end