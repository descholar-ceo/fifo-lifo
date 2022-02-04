class Lifo
    def initialize(utils)
        @utils = utils
    end
    def get_profit_or_lost_with_lifo
        total_profit = 0
        total_cost = 0
        cost_of_goods_sold = 0
        total_income = 0
        temp_remaining_invetory = 0
    
        purchases = @utils.get_purchase_and_prices[0].reverse()
        purchases_prices = @utils.get_purchase_and_prices[1].reverse()
    
        sells = @utils.get_sell_and_prices[0]
        sells_prices = @utils.get_sell_and_prices[1]
        
        purchases.each_with_index do |curr_purchase, purchase_index|
            invetory = curr_purchase + temp_remaining_invetory # initializing the invetory
            temp_remaining_invetory = 0
            total_amt_spent = invetory * purchases_prices[purchase_index] # setting the amout spent purchasing a given good
            temp_income = 0 # initializing a temporary income variable to zero
            sells.each_with_index do |curr_sell, index|
                break if sells.sum().zero?
                next if curr_sell.zero?
                if invetory.zero? || ((invetory + curr_sell) < 0)# whenever the current invetory is zero
                    temp_remaining_invetory = invetory
                    total_profit += temp_income - total_amt_spent
                    cost_of_goods_sold += total_amt_spent
                    total_income += temp_income
                    temp_income = 0
                    total_amt_spent = 0
                    break
                end
                temp_income += (-1 * curr_sell) * sells_prices[index] # calculating the income at every selling and save it in a temporary variable
                invetory += curr_sell # modifying the invetory whenever we sell
                sells[index] = 0 # setting the sell to zero so that it won't count for the next time
            end
            remaining_invetory_cost = total_amt_spent - (invetory * purchases_prices[purchase_index])
            total_profit += temp_income - remaining_invetory_cost
            total_income += temp_income
            cost_of_goods_sold += remaining_invetory_cost
            break if sells.sum().zero?
        end
        
        result = if total_profit.positive?
            "The total profit with LIFO is: #{total_profit}"
        else
            "The loss with LIFO is: #{total_profit}"
        end
        [result, cost_of_goods_sold, total_income]
    end
end
