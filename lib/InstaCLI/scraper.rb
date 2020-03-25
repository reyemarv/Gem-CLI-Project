class Scraper
    
    def self.get_page
        html = Nokogiri::HTML(open("https://socialblade.com/instagram/"))
    end 

    def self.create_account
        html = self.get_page
        html.css("div .table-body").each do |user|
            account = Instagram.new
            account.name = user.css(".table-cell.section-lg").text
            account.rank = user.css(".table-cell.section-rank").text
            account.user_name = user.css(".table-cell:nth-child(3)").text 
            account.followers = user.css(".table-cell:nth-child(6)").text
            Instagram.all << account 
        end 
    end

end 