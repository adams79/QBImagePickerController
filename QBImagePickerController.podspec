Pod::Spec.new do |s|
  s.name         = 'QBImagePickerController'
  s.version      = '0.0.1'
  s.summary      = 'A clone of the UIImagePickerController with multiple selection feature.'
  s.homepage     = 'https://github.com/adams79/QBImagePickerController'
  s.license      = 'MIT'
  s.author       = { 'Katsuma Tanaka' => 'questbeat@gmail.com' }
  s.source       = { :git => 'https://github.com/adams79/QBImagePickerController.git'}
  s.platform     = :ios
  s.requires_arc = true
  s.framework    = 'AssetsLibrary'
  s.source_files = 'QBImagePickerController/*.{h,m}'
  s.resources    = "QBImagePickerController/resources/*.png"
end