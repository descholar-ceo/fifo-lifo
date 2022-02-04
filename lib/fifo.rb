class Fifo
    def initialize(utils)
        @utils = utils
    end
   # calculating whether we have profit all loss and output final results
    def get_profit_or_lost_with_fifo
        list_purchases = @utils.get_purchase_and_prices[0]
        list_of_purchases_prices = @utils.get_purchase_and_prices[1]
        list_of_sells = @utils.get_sell_and_prices[0]
        list_of_sells_prices = @utils.get_sell_and_prices[1]
        @utils.calculate_profit_or_loss(list_purchases, list_of_purchases_prices, list_of_sells, list_of_sells_prices)
    end 
end
