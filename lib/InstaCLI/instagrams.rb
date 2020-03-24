class Instagram

attr_accessor :name, :rank, :user_name, :followers

@@all = []

def initialize
    @name = name 
    @rank = rank 
    @user_name = user_name 
    @followers = followers 
end 

def self.all
    @@all 
end 

def self.display_list
    puts "-----Top 25 Accounts-----"
    puts ""
    self.all.each do |account|
        puts "#{account.rank}. #{account.name}"
    end 
    puts ""
    puts "-------------------------"
end 

def self.find_by_rank(input)
    self.all.find{|account| account.rank.to_i == input.to_i}
end  

def self.display_account_details(account)
    puts ""
    puts "Account Details"
    puts "-------------------------"
    puts "Rank: #{account.rank}"
    puts "Name: #{account.name}"
    puts "User_name: @#{account.user_name}"
    puts "Followers: #{account.followers}"
    puts "-------------------------"
end 
    
end 