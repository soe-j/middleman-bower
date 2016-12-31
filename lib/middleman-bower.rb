require "middleman-core"

Middleman::Extensions.register :bower do
  require "middleman-bower/extension"
  MyExtension
end
