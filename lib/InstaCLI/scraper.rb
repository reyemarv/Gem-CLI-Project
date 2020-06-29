class Scraper
    
    def self.get_page
        html = Nokogiri::HTML(open("https://socialblade.com/instagram/"))
    end 


    # create_account is creating a new object for every row of data.
    # from there it is assigning a variable to a specific data scraped from site.
    # this is then pushed into our 'all' to hold onto until we call it.
    def self.create_account
        html = self.get_page
        html.css("div .table-body").each do |user|
            account = Instagram.new
            account.name = user.css(".table-cell.section-lg").text
            account.rank = user.css(".table-cell.section-rank").text
            account.handle = user.css(".table-cell:nth-child(3)").text 
            account.followers = user.css(".table-cell:nth-child(6)").text
            Instagram.all << account 
        end 
    end

end 