# Require core library
require 'middleman-core'

# Extension namespace
class MyExtension < ::Middleman::Extension
  option :my_option, 'default', 'An example option'

  def initialize(app, options_hash={}, &block)
    # Call super to build options from the options_hash
    super

    # Require libraries only when activated
    # require 'necessary/library'

    # set up your extension
    # puts options.my_option
    @app = app
  end

  def after_configuration
    # Do something
  end

  # A Sitemap Manipulator
  def manipulate_resource_list(resources)
    components_basepath = 'javascripts'

    bower_resources = Dir.glob('./tmp/bower_components/**/*.js').map do |filepath|
      fullpath = File.expand_path(filepath, @app.root)
      Middleman::Sitemap::Resource.new(@app.sitemap, "#{components_basepath}/#{filepath[23..-1]}", fullpath)
    end

    resources + bower_resources
  end

  # helpers do
  #   def a_helper
  #   end
  # end
end
