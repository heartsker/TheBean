Pod::Spec.new do |spec|

  spec.name = "Recipe"
  spec.version = "0.1.0"
  
  spec.summary = "Recipe module provides functionality for managing recipes"

  spec.homepage = "Local"
  spec.author = { "Daniel Pustotin" => "daniel.pustotin@gmail.com" }
  spec.source = { :path => "*" }

  spec.ios.deployment_target = "13.0"
  spec.static_framework = true

  spec.source_files = "#{spec.name}/Source/**/*.{swift}"

  spec.resource_bundles = {
    "#{spec.name}Resources" => ["#{spec.name}/Resources/**/*.{json}"]
  }

  spec.dependency "Utils"

end