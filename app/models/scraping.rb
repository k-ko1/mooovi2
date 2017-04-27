require 'mechanize'
class Scraping
  def self.get_products
    links = [] #個別ページのリンクを保存する配列
    title = []
    image_url = []
    next_link = ""
    agent = Mechanize.new
    while true do
      current_page = agent.get("http://review-movie.herokuapp.com" + next_link)
      elements = current_page.search('.entry-title a')

      elements.each do |ele|
        links << ele[:href]
        # product_url = ele.get_attribute('href')
      end

      if current_page.at('.pagination .next a')
        next_link = current_page.at('.pagination .next a')[:href]
      else
        break
      end

    end

    links.each do |link|
      product_page = agent.get("http://review-movie.herokuapp.com" + link)
      title = product_page.at('.entry-title').inner_text if product_page.at('.entry-title')
      image_url = product_page.at('.entry-content img')[:src] if product_page.at('.entry-content img')
      director = product_page.at('.review_details .director span').inner_text if product_page.at('.review_details .director span')
      detail = product_page.at('.entry-content p').inner_text if product_page.at('.entry-content p')
      open_date = product_page.at('.review_details .date span').inner_text if product_page.at('.review_details .date span')
      product = Product.where(title: title, image_url: image_url, director: director, detail: detail, open_date: open_date).first_or_initialize
      product.save
    end
  end
end