Pod::Spec.new do |s|
  s.name             = 'MVPArchitecture'
  s.version          = '1.0.0'
  s.summary          = 'Model View Presenter architecture'

  s.description      = 'a framework for Model View Presenter architecture'

  s.homepage         = 'https://github.com/minhhien177/MVPArchitecture'
  s.license          = 'MIT'
  s.author           = { 'vomh' => 'minhhien177@gmail.com' }
  s.source           = { :git => 'https://github.com/minhhien177/MVPArchitecture.git', :tag => '1.0.0' }

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'
  s.static_framework = true

  s.source_files = 'Classes/**/*'

  s.dependency 'RxSwift'
end
