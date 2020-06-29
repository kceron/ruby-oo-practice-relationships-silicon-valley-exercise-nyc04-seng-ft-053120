class Startup
    #attr_accessor :name, :domain
    attr_reader :founder, :name, :domain
    @@all = []

    def initialize(name, founder, domain)
        @name = name 
        @founder = founder
        @domain = domain 
        @@all << self 
    end

    def pivot(domain, name)
        @name=(name)
        @domain=(domain)
    end

    def self.all
        @@all
    end

    #given a string of a founder's name, returns the first startup whose founder's name matches
    def self.find_by_founder(founder_name)
        self.all.find {|startup| startup.founder == founder_name}
    end

    #should return an array of all of the different startup domains
    def self.domains
        self.all.collect {|startup| startup.domain}
    end

    #(startup, venture_capitalist, type, investment)
    def sign_contract(vc_object, type, amount)
        FundingRound.new(self, vc_object, type, amount)
    end

    #helper method to get specific startup from founding roudns
    def find_startup
        FundingRound.all.select {|fr| fr.startup == self }
    end

    #Returns the total number of funding rounds that the startup has gotten
    def num_funding_rounds
        self.find_startup.count
    end

    #Returns the total sum of investments that the startup has gotten
    def total_funds
        self.find_startup.reduce(0) {|sum, n| sum + n.investment}
    end

    #Returns a unique array of all the venture capitalists that have invested in this company
    def investors
        self.find_startup.map { |inv| inv.venture_capitalist}.uniq
    end

    #Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club
    def big_investors
        self.investors.select {|inv| inv.total_worth >= 1_000_000_000}
    end
end
