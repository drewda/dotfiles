#!/bin/env ruby
dirs = %w(bash/.bash_aliases bash/.inputrc zsh/.zshrc git/.gitconfig vim/.vim vim/.vimrc .gemrc)
current_dir = File.expand_path(Dir.pwd)
home_dir = File.expand_path("~")
 
dirs.each do |dir|
  dir = File.join(current_dir, dir)
  symlink = File.join(home_dir, File.basename(dir))
  if File.exist?(symlink)
    puts "File already exists: #{symlink}"
  else
    puts "Symlinking: #{symlink}"
    `ln -ns #{dir} #{symlink}`
  end
end

sublime_user_dir = File.join(home_dir, 'Library/Application Support/Sublime Text 2/Packages/User')

dirs = %w(sublime_text/Preferences.sublime-settings)
dirs.each do |dir|
  dir = File.join(current_dir, dir)
  symlink = File.join(sublime_user_dir, File.basename(dir))
  if File.exist?(symlink)
    puts "File already exists: #{symlink}"
  else
  	symlink.gsub!(' ', '\ ')
    puts "Symlinking: #{symlink}"
    `ln -ns #{dir} #{symlink}`
  end
end
