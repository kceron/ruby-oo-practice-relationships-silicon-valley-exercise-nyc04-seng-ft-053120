require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

#(name, founder, domain)
s1 = Startup.new("Donuts", "Donut", "donut.com")
s2 = Startup.new("Facebook", "Mark", "fb.com")
s3 = Startup.new("Twitter", "Nosequien", "twitter.com")
s4 = Startup.new("Sweets", "Donut", "sweets,com")

#(name, total_worth)
v1 = VentureCapitalist.new("Francisco", 1_000_000_000)
v2 = VentureCapitalist.new("Barbs", 2_000_000)
v3 = VentureCapitalist.new("Istvan", 5_000_000)
v4 = VentureCapitalist.new("Xan", 1_000_000)

f1 = FundingRound.new(s1, v1, "Seed", 3_000_000)
f2 = FundingRound.new(s1, v2, "Seed", 9_000_000)
f3 = FundingRound.new(s3, v2, "Seed", 1_000_000)
f2 = FundingRound.new(s1, v2, "Seed", 1_000_000)


#Startup.all
#VentureCapitalist.all 
#VentureCapitalist.tres_commas_club
#Startup.find_by_founder("Donut")
#Startup.domains
#s1.sign_contract(v4, "Seed", 500)
#s1.num_funding_rounds
#s1.find_startup
#s1.total_funds
#s1.investors
#s1.big_investors
#s1.big_investors
#v4.offer_contract(s3, "Seed", 700)
#v2.funding_rounds 
#v2.portfolio
#v1.biggest_investment
#FundingRound.all
#v2.invested("donut.com")
#v2.funding_rounds

binding.pry
0 #leave this here to ensure binding.pry isn't the last line