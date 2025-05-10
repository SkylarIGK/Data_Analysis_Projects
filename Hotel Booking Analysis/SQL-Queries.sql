-- Create a new table 'Booking1' by selecting specific relevant columns from the original 'Booking' table.
CREATE OR REPLACE TABLE `precise-victory-433508-s4.Hotel_Booking.Booking1` AS
SELECT
  hotel,
  is_canceled,  
  lead_time,
  arrival_date_month,
  children,
  babies,
  country,
  market_segment,
  is_repeated_guest,
  previous_cancellations,
  reserved_room_type,
  booking_changes,
  customer_type,
  reservation_status
FROM `precise-victory-433508-s4.Hotel_Booking.Booking`;

-- Perform a null check on each column in the original 'Booking' table and count how many rows are null for each.
SELECT
  COUNT(*) AS total_rows, -- Total number of rows in the table

  -- Count how many NULL values exist in each column
  COUNTIF(hotel IS NULL) AS null_hotel,
  COUNTIF(is_canceled IS NULL) AS null_is_canceled,
  COUNTIF(lead_time IS NULL) AS null_lead_time,
  COUNTIF(arrival_date_month IS NULL) AS null_arrival_date_month,
  COUNTIF(children IS NULL) AS null_children,
  COUNTIF(babies IS NULL) AS null_babies,
  COUNTIF(country IS NULL) AS null_country,
  COUNTIF(market_segment IS NULL) AS null_market_segment,
  COUNTIF(is_repeated_guest IS NULL) AS null_is_repeated_guest,
  COUNTIF(previous_cancellations IS NULL) AS null_previous_cancellations,
  COUNTIF(reserved_room_type IS NULL) AS null_reserved_room_type,
  COUNTIF(booking_changes IS NULL) AS null_booking_changes,
  COUNTIF(days_in_waiting_list IS NULL) AS null_days_in_waiting_list,
  COUNTIF(customer_type IS NULL) AS null_customer_type,
  COUNTIF(total_of_special_requests IS NULL) AS null_total_of_special_requests,
  COUNTIF(reservation_status IS NULL) AS null_reservation_status
FROM `precise-victory-433508-s4.Hotel_Booking.Booking`;

-- Preview the first 5 rows of the cleaned 'Booking1' table
SELECT *
FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`
LIMIT 5;

-- Explore the unique values for various columns in the 'Booking1' table
SELECT DISTINCT hotel FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT is_canceled FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT lead_time FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT arrival_date_month FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT country FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT market_segment FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT is_repeated_guest FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT previous_cancellations FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT reserved_room_type FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT booking_changes FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT days_in_waiting_list FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT customer_type FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT total_of_special_requests FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;
SELECT DISTINCT reservation_status FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`;

-- Identify and review rows with potentially invalid or extreme data entries
SELECT *
FROM `precise-victory-433508-s4.Hotel_Booking.Booking1`
WHERE lead_time < 0 OR children < 0 OR babies > 5 OR booking_changes > 20;

-- Here I will explain some data tranform and cleaning that I did in Power BI
Key steps included:
Fixing column types (e.g., converting month strings to proper date types)
Creating calculated columns such as cancellation rate, total children (children + babies)
Grouping numeric columns for better visualization (e.g., waiting list days)
Sorting categorical values with custom logic where needed
