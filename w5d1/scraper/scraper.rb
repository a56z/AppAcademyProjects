require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
    url = "https://www.greatlakesskipper.com/oem-parts-and-accessories/chaparral-boats?product_list_limit=96"
    unparsed_page = HTTParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    
    

    parts = Array.new
    parts_listed = parsed_page.css('li.item.product.product-item')

    page = 1
    last_page = 10
    per_page = parts_listed.count
    total = ((page.to_f * (last_page.to_f - 1) * per_page.to_f) + (last_page.to_f * per_page.to_f)).round
    
    while page <= last_page
        pagination_url = "https://www.greatlakesskipper.com/oem-parts-and-accessories/chaparral-boats?p=#{page}&product_list_limit=96"
        puts pagination_url
        puts "Page: #{page}"

        pagination_unparsed_page = HTTParty.get(pagination_url)
        pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
        pagination_parts_listed = pagination_parsed_page.css('li.item.product.product-item')
        pagination_parts_listed.each do |part_listed|
            part = {
                product_item: part_listed.css('a.product-item-link').text,
                price: part_listed.css('span.price').text,
                sku: part_listed.css('span.gls-location').text,
                url: "https://www.greatlakesskipper.com/oem-parts-and-accessories/chaparral-boats?"
            }
            parts << part
            puts "#{part[:product_item]}"
            puts "#{part[:price]}"
            puts "#{part[:sku]}"
            puts ""
        end
        page += 1
    end
    # byebug    
end

scraper