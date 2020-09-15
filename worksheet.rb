
########################################################
# Step 1: Establish the layers: Create a list of the layers you identify.
# TOP LEVEL: Drivers
# MIDDLE LAYER: All trips taken
# BOTTOM LAYER:  Individual Rides Info

# Which layers are nested in each other?
# Bottom layer has the nested info
#
# # Which layers of data "have" within it a different layer?
# driver_array >> drivers_id >>  date- cost -rider_id rating

# Which layers are "next" to each other?
# date/cost/rider_id/rating

########################################################
# Step 2: Assign a data structure to each layer

# TOP LEVEL: A Hash of All Drivers info 
# MIDDLE LAYER:  Is an Array with unique Driver IDs
# BOTTOM LAYER:  Nested within array is a Hash with individual Ride Info Keys (Date/Cost/Rider_ID/Rating)


########################################################
# Step 3: Make the data structure!
# Setup the entire data structure:

drivers_array = {
    DR0001: [
        {
            date: "Feb 3rd 2016",
            cost: 10,
            rider_id: "RD0003",
            rating: 3
        },
        {
            date: "Feb 3rd 2016",
            cost: 30,
            rider_id: "RD0015",
            rating: 4
        },
        {
            date: "Feb 2nd 2016",
            cost: 45,
            rider_id: "RD0003",
            rating: 2
        }
    ],
    DR0002: [
        {
            date: "Feb 2nd 2016",
            cost: 25,
            rider_id: "RD0073",
            rating: 5
        },
        {
            date: "Feb 2 2016",
            cost: 15,
            rider_id: "RD0013",
            rating: 1
        },
        {
            date: "Feb 2nd 2016",
            cost: 35,
            rider_id: "RD0066",
            rating: 3
        }
    ],
    DR0003: [
        {
            date: "Feb 2nd 2016",
            cost: 5,
            rider_id: "RD0066",
            rating: 5
        },
        {
            date: "Feb 2nd 2016",
            cost: 50,
            rider_id: "RD0003",
            rating: 2
        }
    ],
    DR0004: [
        {
            date: "Feb 2nd 2016",
            cost: 5,
            rider_id: "RD0022",
            rating: 5
        },
        {
            day: "Feb 2nd 2016",
            cost: 10,
            rider_id: "RD0022",
            rating: 4
        },
        {
            date: "Feb 2nd 2016",
            cost: 20,
            rider_id: "RD0073",
            rating: 5
        }
    ]
}


# QUESTION ONE: The number of rides each driver has given?
# -----------------------------------
# method to see how many rides each driver has done
def num_of_rides_method(drivers_array)
  drivers_array.each do |driver_id, rides_array|
    puts "The driver with ID: #{driver_id} gave #{rides_array.length} rides"
  end
end

num_of_rides_method(drivers_array)

# QUESTION TWO: The total amount of money each driver has made?
# -----------------------------------
# method that sees how much money each driver made

def driver_earning_method(driver_array)
  drivers_earnings= 0
  driver_array.each do |driver,ride_array|
    total = 0
    ride_array.each do |ride|
      total += ride[:cost]
    end
    puts "The driver with ID: #{driver} made $ #{total}"
  end
end
puts ""

driver_earning_method(drivers_array)
puts ""


#QUESTION THREE # - What is the average rating for each driver?

drivers_array.each do |driver,rides_array|
  total_driver_ratings = 0

  rides_array.each do |ride_hash|
    total_driver_ratings += ride_hash[:rating]
  end
  average= total_driver_ratings.to_f/rides_array.length
  puts "Driver with ID: #{driver}, has a rating average of #{average.round(1)}"
end
puts ""

# QUESTION FOUR: Which driver made the most money?

def driver_max(driver_array)
  total_hash = {}
  driver_array.each do |driver, rides_array|
    total = 0
    rides_array.each do |ride|
      total += ride[:cost]
    end
    total_hash[driver] = total
  end
  return total_hash
end

highest_earning_driver = driver_max(drivers_array).max_by {|driver,ride_total|ride_total}
puts "The driver with ID:#{highest_earning_driver[0]} earned the most with a total of $ #{highest_earning_driver[1]}."

#QUESTION FIVE: Which driver has the highest average rating?
#method to find the highest rating
def highest_rating_method(drivers_array)
  total_rating_hash= {}
    drivers_array.each do |driver,rides_array|
      total = 0
      rides_array.each do |ride|
        total += ride[:rating]
      end
      average = (total.to_f/rides_array.length)
      total_rating_hash[driver]= average.round(1)
    end
    return total_rating_hash
end

puts ""

highest_rating= highest_rating_method(drivers_array).max_by { |driver,rate_totals|rate_totals}

puts " The driver with ID:#{highest_rating[0]} had the highest rating with #{highest_rating[1]}"

