class Utilities
    attr_reader :bitcoins
    attr_reader :prices
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

    # reverse the array
    def reverse_array(arr)
        arr.reverse()
    end

    def calculate_profit_or_loss(purchases, purchases_prices, sells, sells_prices)
        total_cost = 0
        cost_of_goods_sold = 0
        total_income = 0
        temp_remaining_invetory = 0
        
        purchases.each_with_index do |curr_purchase, purchase_index|
            invetory = curr_purchase + temp_remaining_invetory  # initializing the invetory
            temp_remaining_invetory = 0
            total_amt_spent = invetory * purchases_prices[purchase_index] # setting the amout spent purchasing a given good
            temp_income = 0 # initializing a temporary income variable to zero
            sells.each_with_index do |curr_sell, index|
                break if sells.sum().zero? # breaking the loop if there is no more sells remaining on the list
                next if curr_sell.zero?
                if invetory.zero? || ((invetory + curr_sell) < 0) # whenever the current invetory is less than the sell
                    temp_remaining_invetory = invetory
                    cost_of_goods_sold += total_amt_spent
                    total_income += temp_income
                    temp_income = 0 # resetting the temporary income variable to zero
                    total_amt_spent = 0
                    break
                end
                temp_income += (-1 * curr_sell) * sells_prices[index] # calculating the income at every selling and save it in a temporary variable
                invetory += curr_sell # modifying the invetory whenever we sell
                sells[index] = 0 # setting the sell to zero so that it won't count for the next time
            end
            remaining_invetory_cost = total_amt_spent - (invetory * purchases_prices[purchase_index])
            total_income += temp_income
            cost_of_goods_sold += remaining_invetory_cost
            break if sells.sum().zero?
        end
        total_profit = total_income - cost_of_goods_sold # calculating the final total profit
        result = if total_profit.positive?
            "The total profit is: #{total_profit}"
        else
            "The loss is: #{total_profit}"
        end
        [result, cost_of_goods_sold, total_income]
    end
end
