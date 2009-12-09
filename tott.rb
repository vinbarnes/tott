#!/usr/bin/env ruby -w

DEBUG = false
def log(msg) puts msg if DEBUG; end

dir = (ARGV[0][0] == File::SEPARATOR[0]) ? ARGV[0] : File.expand_path(File.join(File.dirname(__FILE__), ARGV[0]))

log "** Analyzing directory: " + dir

Dir.chdir(dir)

git_dirs = Dir['**/.git'].map {|d| d.sub('.git', '')}
log "** git directories: "
log git_dirs

git_dirs.each do |git_dir|
  log "** git gc starting in: #{git_dir}"
  Dir.chdir(git_dir) do
    log `git gc --aggressive`
  end
end

