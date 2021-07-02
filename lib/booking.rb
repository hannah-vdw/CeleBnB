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

  booking_result = connection.exec_params("SELECT * FROM bookings WHERE user_id = $1;", [user_id.to_i])
  property_result = connection.exec_params("SELECT * FROM properties WHERE id = $1;", [booking_result.first['property_id']])
  users_result = connection.exec_params("SELECT * FROM users WHERE id = $1;", [user_id.to_i])
  
  Booking.new(booking_date: booking_result.first['booking_date'], username: users_result.first['username'], property_name: property_result.first['name'])
  end
end
