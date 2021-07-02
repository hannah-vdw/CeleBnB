class Booking

  attr_reader :booking_date, :username, :property_name

  def initialize(booking_date:, username:, property_name:)
    @booking_date = booking_date
    @username = username
    @property_name = property_name
  end

  def self.get(user_id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'celebnb_test')
  else
      connection = PG.connect(dbname: 'celebnb')
  end

  booking_result = connection.exec_params(
    "SELECT bookings.booking_date, properties.name, users.username 
    FROM bookings 
    JOIN properties ON property_id = properties.id 
    JOIN users ON user_id = users.id
    WHERE user_id = $1;", [user_id.to_i])
  
  Booking.new(booking_date: booking_result.first['booking_date'], username: booking_result.first['username'], property_name: booking_result.first['name'])
  end
end
