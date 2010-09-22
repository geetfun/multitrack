
class StatsApp
  Visits = DB[:visits]

  Gif      = [200, {'Content-Type' => 'image/gif'}, ["GIF89a\001\000\001\000\200\000\000\000\000\000\000\000\000!\371\004\001\000\000\000\000,\000\000\000\000\001\000\001\000\000\002\002D\001\000;"]]
  NotFound = [404, {'Content-Type' => 'text/plain'}, ["File not Found"]]

  def call(env)
    req = Rack::Request.new(env)

    if req.path_info =~ /visit\/record\.gif/
      Visits.insert(:visitor => req.params['a'], :referrer => req.params['r'], :landing_page => req.params['l'] )
      return Gif
    else
      NotFound
    end

 end

end


