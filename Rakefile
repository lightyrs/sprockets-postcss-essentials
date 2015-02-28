require "bundler/gem_tasks"

desc "Build postcss-essentials bundle"
task :bundle do
  browserify = "vendor/postcss-essentials/node_modules/.bin/browserify"
  system "#{browserify} -r./vendor/postcss-essentials/index.js:postcss-essentials > vendor/bundle.js"
end
