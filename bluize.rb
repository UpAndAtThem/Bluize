class Bluize
  def erb(view_file, local = {})
    b = binding
    binding.pry
    message = local[:message]
    content = File.read("views/#{view_file}.erb")
    
    ERB.new(content).result(b)
  end

  def response(status, headers, body = "")
    body = yield if block_given?

    [status, headers, ["#{body}"]]
  end
end