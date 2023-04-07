# frozen_string_literal: true

# Description: Service to scrap google search results
class GoogleScrapService
  def scrap(query)
    url = "https://www.google.com/search?q=#{query}&num=21"
    raw_page = HTTParty.get(url, headers: random_header)
    parsed_page = Nokogiri::HTML(raw_page.body)

    parsed_page.css('div.g').each do |result|
      ScrapperResult.create!(formatted_results(result))
    end
  end

  private

  def formatted_results(result)
    {
      title: result.css('h3').text,
      link: fetch_link(result),
      date: fetch_date(result)
    }
  end

  def fetch_date(result)
    date = result.css('span.MUxGbd > span').last
    date.nil? ? '' : date.text
  end

  def fetch_link(result)
    link = result.css('.yuRUbf > a').first
    link.nil? ? '' : link['href']
  end

  def random_header
    headers = [
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36',
      'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/72.0.3626.121 Safari/537.36',
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.157 Safari/537.36',
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.110 Safari/537.36',
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36',
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.71 Safari/537.36'
    ]

    { 'User-Agent' => headers.sample }
  end
end
