class CreateEstates < ActiveRecord::Migration[6.1]
  def change
    create_table :estates, primary_key: 'centre_id' do |t|
      t.string :brand
      t.string :street_address
      t.string :city
      t.integer :postcode
      t.string :country_iso_code
      t.string :longitude
      t.string :latitude
      t.string :center_status
      t.string :product_category
      t.string :product_name
      t.string :building_description
      t.string :local_area_description
      t.float :total_building_size
      t.string :area_size_unit
      t.integer :min_desks
      t.integer :max_desks
      t.datetime :centre_open_date
      t.integer :min_term
      t.integer :max_term
      t.float :min_cost
      t.float :max_cost
      t.string :currency
      t.string :featured_image
      t.string :external_building_image
      t.string :high_res_images
      t.string :high_res_image_tags
      t.string :low_res_images
      t.string :low_res_image_tags
      t.boolean :feature_24_hour_access
      t.boolean :feature_24_hour_cctv_monitoring
      t.boolean :feature_airport_location
      t.boolean :feature_bicycle_storage
      t.boolean :feature_breakout_areas
      t.boolean :feature_business_park_location
      t.boolean :feature_city_town_centre
      t.boolean :feature_day_care
      t.boolean :feature_disabled_facilities
      t.boolean :feature_double_glazing
      t.boolean :feature_elevator
      t.boolean :feature_gym_and_fitness_room
      t.boolean :feature_lounge_area
      t.boolean :feature_major_transport_links
      t.boolean :feature_meeting_rooms
      t.boolean :feature_on_site_dry_cleaning
      t.boolean :feature_on_site_lunch_restaurant
      t.boolean :feature_on_site_sandwhich_coffee_bar
      t.boolean :feature_outside_seating_area_terrace
      t.boolean :feature_parking
      t.boolean :feature_raised_floors
      t.boolean :feature_regusnet_high_speed_internet
      t.boolean :feature_sandwhich_service
      t.boolean :feature_secure_underground_parking
      t.boolean :feature_showers
      t.boolean :feature_sky_tv
      t.boolean :feature_smoking_areas
      t.boolean :feature_suspended_ceilings
      t.boolean :feature_temp_control
      t.boolean :feature_vending_machines
      t.boolean :feature_videoconferencing_studio
      t.boolean :feature_voicemail

      t.timestamps
    end
  end
end
