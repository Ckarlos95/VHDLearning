for file in app/views/devise/**/*.erb; do erb2slim $file ${file%erb}slim && rm $file; done