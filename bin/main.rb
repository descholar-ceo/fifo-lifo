require_relative '../lib/utils'
require_relative '../lib/fifo'
require_relative '../lib/lifo'

class Main
    def initialize(bitcoins, prices)
        @utils = Utilities.new(bitcoins, prices)
        @fifo = Fifo.new(@utils)
        @lifo = Lifo.new(@utils)
    end

    # displays all of the result desired
    def display_results
        fifo_gotten_results = @fifo.get_profit_or_lost_with_fifo
        fifo_cost_of_goods_sold = fifo_gotten_results[1]
        fifo_total_income = fifo_gotten_results[2]
        lifo_gotten_results = @lifo.get_profit_or_lost_with_lifo
        lifo_cost_of_goods_sold = lifo_gotten_results[1]
        lifo_total_income = lifo_gotten_results[2]

        units_purchased = @utils.get_unit_purchased
        units_sold = @utils.get_unit_sold
        final_invetory = units_purchased + units_sold

        puts "\n\n"
        puts "=======  The following are the general results regardless of FIFO nor LIFO approach  ======="
        puts "============================================================================================"
        puts "The final invetory is: #{final_invetory}"
        puts "Units sold are: #{units_sold}"
        puts "Units purchased are: #{units_purchased}"
        puts "The total cost is: #{@utils.get_total_cost}"

        puts "\n\n"

        puts "=======  The following are the results gotten if we perform the FIFO approach  ======="
        puts "======================================================================================"
        
        puts "The cost_of_goods_sold with FIFO is: #{fifo_cost_of_goods_sold}"
        puts "The total_income with FIFO is: #{fifo_total_income}"
        puts fifo_gotten_results[0]

        puts "\n\n"

        puts "=======  The following are the results gotten if we perform the LIFO approach  ======="
        puts "======================================================================================"
        
        puts "The cost_of_goods_sold with LIFO is: #{lifo_cost_of_goods_sold}"
        puts "The total_income with LIFO is: #{lifo_total_income}"
        puts lifo_gotten_results[0]
        puts "\n\n"
    end
end

isbit_calculator = Main.new([4, -2, -1, 5, -0.5, -0.5, -4.5], [5000, 6500, 7000, 6000, 8000, 9000, 6500])

isbit_calculator.display_results
