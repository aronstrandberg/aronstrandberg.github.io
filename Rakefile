require "fileutils"

task :default => :dev
task :dev =>[:compass, :coffee, :jekyll]

desc "Runs compass"
task :compass do
	system 'compass compile style'
end

desc "Compiles and concatenates coffee files"
task :coffee do
	system 'coffee --join scripts.js --compile coffee/*.coffee'
end

desc "Runs jekyll"
task :jekyll do
	system 'jekyll'
end