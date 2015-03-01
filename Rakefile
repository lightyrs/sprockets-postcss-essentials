require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc "Build postcss-essentials bundle"
task :bundle do
  browserify = "vendor/postcss-essentials/node_modules/.bin/browserify"
  system "#{browserify} ./vendor/postcss-essentials/index.js -s postcss_essentials > vendor/bundle.js"
end
