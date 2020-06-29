class InstaCLI::CLI
    
    # this is the method that will launch the program
    def start
        puts ""
        puts "Welcome to the current top 25 Instagram accounts!"
        puts "Would you like to see the list? Y/N"
        runner
    end 

    # runner will be what holds the first layer of choice for user
    # user will choose if they want to see a list of top 25 accounts or exit the program
    # runner is placed at end to help loop around in case of error
    def runner
        input = nil 
        input = gets.strip.downcase
        if input ==  "y"
            choose_account 
        elsif input == "n"
            puts "Thank you for stopping by, come back to visit!" 
        else
            puts ""
            puts "***** Please enter 'Y' for list of accounts or 'N' to exit *****"
            puts ""
            runner 
        end 
    end 

    # this method will run once user has chosen yes to see list of top 25 accounts
    # the method will scrap the site chosen and once objects have been created will present that list of objects
    # once list is displayed, user may choose to either exit or go further in for more detials by running #account_getter
    def choose_account
        Scraper.create_account
        Instagram.display_list 
        puts "Enter number of account you'd like more details on, or 'Exit' to exit"
        account_getter
    end   

    # this method is in charge of taking in the user's input, then checking to make sure it is valid
    # once confirmed if valid, will diplay furher details of account
    # user will then have choice to either pick another account or exit
    # if invalid answer before or after account info, will loop back to beginning of #account_getter
    def account_getter
        input = nil 
        input = gets.strip  
        if input.to_i > 0 && input.to_i < 26
            account = Instagram.find_by_rank(input)
            account.display_account_details
            puts "Would you like to see another? Y/N"
            detail_getter 
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

    # this method is similar to that of #account_getter, however with different puts messages
    # this is user's ability to look at another account or exit
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