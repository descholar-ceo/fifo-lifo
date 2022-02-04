class Lifo
    def initialize(utils)
        @utils = utils
    end
    def get_profit_or_lost_with_lifo
        list_purchases = @utils.reverse_array(@utils.get_purchase_and_prices[0])
        list_of_purchases_prices = @utils.reverse_array(@utils.get_purchase_and_prices[1])
        list_of_sells = @utils.reverse_array(@utils.get_sell_and_prices[0])
        list_of_sells_prices = @utils.reverse_array(@utils.get_sell_and_prices[1])
        @utils.calculate_profit_or_loss(list_purchases, list_of_purchases_prices, list_of_sells, list_of_sells_prices)
    end
end
