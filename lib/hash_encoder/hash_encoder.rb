module HashEncoder
  def encode_hash(input)
    output = Hash.new
    input.each do |key, value|
      output[key] = value.encode('utf-8', :invalid => :replace, :undef => :replace, :replace => '_') rescue nil
    end
    output
  end
end
