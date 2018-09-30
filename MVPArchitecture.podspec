Pod::Spec.new do |s|
  s.name             = 'MVPArchitecture'
  s.version          = '1.0'
  s.summary          = 'a framework for Model View Presenter architecture'

  s.description      = 'TBD'

  s.homepage         = 'TBD'
  s.license          = 'MIT'
  s.author           = { 'vomh' => 'minhhien177@gmail.com' }
  s.source           = { :git => 'TBD' }

  s.ios.deployment_target = '9.0'
  s.static_framework = true

  s.source_files = 'MVPArchitecture/**/*'

  s.dependency 'RxSwift'
end
