Pod::Spec.new do |spec|

  spec.name = "Localize"
  spec.version = "0.1.0"
  
  spec.summary = "Localize module provides app localization"

  spec.homepage = "Local"
  spec.author = { "Daniel Pustotin" => "daniel.pustotin@gmail.com" }
  spec.source = { :path => "*" }

  spec.ios.deployment_target = "13.0"
  spec.static_framework = true

  spec.source_files = "#{spec.name}/Source/**/*.{swift}"

  spec.resource_bundles = {
    "LocalizeResources" => ["#{spec.name}/Resources/**/*.{strings,stringsdict}"]
  }

  spec.dependency "Utils"

end