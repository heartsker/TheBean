Pod::Spec.new do |spec|

  spec.name = "Account"
  spec.version = "0.1.0"
  
  spec.summary = "Account module provides Account type and functionality to work with it"

  spec.homepage = "Local"
  spec.author = { "Daniel Pustotin" => "daniel.pustotin@gmail.com" }
  spec.source = { :path => "*" }

  spec.ios.deployment_target = "13.0"
  spec.static_framework = true

  spec.source_files = "#{spec.name}/Source/**/*.{swift}"

end