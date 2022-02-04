class Utilities
    def initialize(bitcoins, prices)
        @bitcoins = bitcoins
        @prices = prices
    end
    # getting all purchases and their prices
    def get_purchase_and_prices
        purchases = []
        mprices = []
        @bitcoins.each_with_index do |curr_bit, index|
            if curr_bit.positive?
                purchases << curr_bit
                mprices << @prices[index]
            end
        end
        [purchases, mprices]
    end

    # getting all sells and prices
    def get_sell_and_prices
        sells = []
        mprices = []
        @bitcoins.each_with_index do |curr_bit, index|
            if curr_bit.negative?
                sells << curr_bit
                mprices << @prices[index]
            end
        end
        [sells, mprices]
    end

    # get the total cost of all purchased goods
    def get_total_cost
        purchases = get_purchase_and_prices[0]
        purchases_prices = get_purchase_and_prices[1]
        total_cost = 0
        purchases.each_with_index do |curr_purchase, index|
            total_cost += (curr_purchase * purchases_prices[index])
        end
        total_cost
    end

    # get the number of all unit sold
    def get_unit_sold
        get_sell_and_prices[0].sum()
    end

    # get the number of all unit purchased
    def get_unit_purchased
        get_purchase_and_prices[0].sum()
    end
end
