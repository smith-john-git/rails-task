require 'csv'

class CsvPersistor
  include HashEncoder

  def initialize(csv)
    @csv = csv
  end

  def persist_csv
    @csv.each do |row|
      encoded = encode_hash(row.to_hash)
      id = encoded['centre_id']
      if Estate.exists?(centre_id: id)
        estate = Estate.find(id)
        estate.update!(encoded.except(:centre_id))
      else
        estate = Estate.new(encoded)
        estate.save!
      end
    end
  end
end