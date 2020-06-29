class Instagram

    # the properties that each account will have    
    attr_accessor :name, :rank, :handle, :followers 

    # will hold our objects created
    @@all = []

    def self.all
        @@all 
    end 

    # will display a full list of 25 account from the table of site
    # Will use the rank as its order and use it to display as list along with name
    def self.display_list
        puts "-----Top 25 Accounts-----"
        puts ""
        self.all.each do |account|
            puts "#{account.rank}. #{account.name}"
        end 
        puts ""
        puts "-------------------------"
    end 

    # this method is to locate the right account that user inputed
    # takes input and returns the first account to match the rank
    def self.find_by_rank(input)
        self.all.find{|account| account.rank.to_i == input.to_i}
    end  

    # this method will be used to show full details of the account once user has chosen
    def display_account_details
        puts ""
        puts "Account Details"
        puts "-------------------------"
        puts "Rank: #{rank}"
        puts "Name: #{name}"
        puts "Handle: @#{handle}"
        puts "Followers: #{followers}"
        puts "-------------------------"
    end 
    
end 