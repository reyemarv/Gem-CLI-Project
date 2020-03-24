class InstaCLI::CLI
    
    def start
        puts ""
        puts "Welcome to the current top 25 Instagram accounts!"
        puts "Would you like to see the list? Y/N"
        self.runner
    end 

    def runner
        input = nil 
        input = gets.strip.downcase
        if input ==  "y"
            self.choose_account 
        elsif input == "n"
            puts "Thank you for stopping by, come back to visit!" 
        else
            puts ""
            puts "***** Please enter 'Y' for list of accounts or 'N' to exit *****"
            puts ""
            runner 
        end 
    end 


    def choose_account
        Scraper.create_account
        Instagram.display_list 
        puts "Enter number of account you'd like more details on, or 'Exit' to exit"
        self.account_getter
    end   

    def account_getter
        input = nil 
        input = gets.strip  
        if input.to_i > 0 && input.to_i < 26
            account = Instagram.find_by_rank(input)
            Instagram.display_account_details(account)
            puts "Would you like to see another? Y/N"
            self.detail_getter 
        elsif input.downcase == "exit"
            puts "Thank you for stopping by, come back to visit!"  
        else 
            Instagram.display_list
            puts ""
            puts "***** Please enter valid number of account you'd like more details on, or 'Exit' to exit *****" 
            puts ""
            account_getter
        end 
    end 

    def detail_getter
        input = nil 
        input = gets.strip.downcase
        if input == "y"
            Instagram.display_list 
            puts "Enter number of account you'd like more details on, or 'Exit' to exit"
            account_getter   
        elsif input == "n"
            puts "Thank you for stopping by, come back to visit!"
        else 
            puts "***** Please enter either 'Y' to see another account or 'N' to exit *****"
            detail_getter 
        end 
    end 
    
end 