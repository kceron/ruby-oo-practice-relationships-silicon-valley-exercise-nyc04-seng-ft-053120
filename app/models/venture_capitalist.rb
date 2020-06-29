class VentureCapitalist
    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name 
        @total_worth = total_worth

        @@all << self 
    end

    def self.all 
        @@all 
    end
    #returns an array of all venture capitalists in the Trés Commas club (they have more then 1,000,000,000 total_worth)
    def self.tres_commas_club
       self.all.select {|ven_cap| ven_cap.total_worth >= 1_000_000_000}
    end

    #(startup, venture_capitalist, type, investment)
    def offer_contract(startup_obj, type, amount)
        FundingRound.new(startup_obj, self, type, amount)
    end

    #returns an array of all funding rounds for that venture capitalist
    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist == self }
    end

    #Returns a unique list of all startups this venture capitalist has funded
    def portfolio
        self.funding_rounds.collect {|fr| fr.startup}.uniq
    end

    #returns the largest funding round given by this venture capitalist
    def biggest_investment
        self.funding_rounds.max_by {|fr| fr.investment}
    end

    # #given a domain string, returns the total amount invested in that domain
    def invested(domain_s)
        self.funding_rounds.select {|fr| fr.startup.domain == domain_s}.reduce(0) {|sum, inv| sum += inv.investment}
    end
end
    #def invested(domain)
    #     total = 0
    #     funding_rounds.each do |fr|
    #         if fr.startup.domain == domain
    #             total += fr.investment
    #         end
    #     end
    #     total
    # end 