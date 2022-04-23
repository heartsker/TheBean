Pod::Spec.new do |spec|

  spec.name = "AdvancedGraphics"
  spec.version = "0.1.0"
  
  spec.summary = "AdvancedGraphics module provides advanced graphics"

  spec.homepage = "Local"
  spec.author = { "Daniel Pustotin" => "daniel.pustotin@gmail.com" }
  spec.source = { :path => "*" }

  spec.ios.deployment_target = "12.0"
  spec.static_framework = true

  spec.source_files = "#{spec.name}/**/*.{swift}"
end