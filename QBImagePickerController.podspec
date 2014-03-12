Pod::Spec.new do |s|
  s.name         = 'QBImagePickerController'
  s.version      = '0.0.1'
  s.summary      = 'A clone of the UIImagePickerController with multiple selection feature.'
  s.homepage     = 'https://github.com/questbeat/QBImagePickerController'
  s.license      = 'MIT'
  s.author       = { 'Katsuma Tanaka' => 'questbeat@gmail.com' }
  s.source       = { :git => 'https://github.com/adams79/QBImagePickerController.git'}
  s.platform     = :ios
  s.framework    = 'AssetsLibrary'
  s.source_files = 'QBImagePickerController/Classes/*.{h,m}'
  s.resources    = 'QBImagePickerController/Classes/QBImagePickerController.bundle'
end