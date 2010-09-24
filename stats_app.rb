
class StatsApp
  GifImage = [200, {'Content-Type' => 'image/gif', 'Cache-Control' => 'private, must-revalidate'}, ["GIF89a\001\000\001\000\200\000\000\000\000\000\000\000\000!\371\004\001\000\000\000\000,\000\000\000\000\001\000\001\000\000\002\002D\001\000;"]]

  def call(env)
    req = Rack::Request.new(env)
    params = req.params

    if params['a']
      Visit.create(
        :uid => params['a'], 
        :referrer => params['r'], 
        :landing_page => params['l']
      )
    end

    GifImage
  end

end


