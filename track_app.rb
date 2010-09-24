require 'erb'

class TrackApp
  @@template = ERB.new( File.read(File.dirname(__FILE__) + '/templates/visit.js.erb') )

  def call(env)
    tmpl = @@template.result(binding)
    [200, {'Content-Type' => 'text/javascript', 'Cache-Control' => 'public, maxage=3600'}, [tmpl]]
  end

end
