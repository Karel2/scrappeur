	require 'open-uri'
	require 'nokogiri'

def crypto_scrapper	

	currencies_name = []
	currencies_value = []
	doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

	doc.css('tr > td.text-left.col-symbol').each do |node|
		currencies_name << node.text
	end

	doc.css('tr > td.no-wrap.text-right > a.price').each do |node|
		currencies_value << node.text
	end

	currencies_value.each_index do |place| 
		currencies_value[place] = currencies_value[place].delete_prefix('$').to_f
	end	

	hash_crypto = currencies_name.zip(currencies_value).to_h

end

def perform 
	crypto_scrapper
end	