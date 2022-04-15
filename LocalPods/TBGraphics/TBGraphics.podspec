Pod::Spec.new do |spec|

    spec.name = 'TBGraphics'
    spec.version = '0.1.0'
    
    spec.summary = 'TBGraphics provides functionality for specific graphic elements'
  
    spec.homepage = 'Local'
    spec.author = { "Daniel Pustotin" => "daniel.pustotin@gmail.com" }
    spec.source = { :path => '*' }
  
    spec.ios.deployment_target = '12.0'
    spec.static_framework = true
  
    spec.source_files = 'TBGraphics/**/*.{swift}'
  end
    