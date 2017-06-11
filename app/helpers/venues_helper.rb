module VenuesHelper

  def options_for_region
    [
      'Ahmednagar', 'Aurangabad', 'Beed', 'Belgaon', 'Belgaum', 'Dhule', 'Jalgaon', 'Kolhapur',
      'Mumbai', 'Nashik', 'North Goa', 'Palghar', 'Pune', 'Raigad', 'Ratnagiri', 'Sangli', 'Satara',
      'Sindhudurg', 'Solapur', 'Thane', 'Usmanabad'
    ]
  end

  def options_for_purpose
    ['Fort', 'Trek', 'Trail', 'Jungle Safari', 'Ghaat', 'Valley', 'Waterfall', 'Beach', 'Sanctuary', 'Caves']
  end

  def options_for_grade
    ['Easiest', 'Easier', 'Easy', 'Medium', 'Difficult', 'Very Difficult', 'Extreme']
  end
end
