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

  helpers do
    def bower_javascripts_include_tag options={}
      components_basepath = 'javascripts'

      paths = Dir.glob('./tmp/bower_components/**/*.js')
      if options[:priorities]
        options[:priorities].reverse.each do |priority_js|
          paths.sort_by! do |path|
            path.include?("#{priority_js}.js") ? 0 : 1
          end
        end
      end
      paths.map do |path|
        content_tag :script, nil, {src: "#{components_basepath}/#{path[23..-1]}"}
      end.join
    end
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
