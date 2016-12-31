require "middleman-core"

Middleman::Extensions.register :middleman-bower do
  require "my-extension/extension"
  MyExtension
end
