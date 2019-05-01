#!/bin/env ruby
dirs = %w(bash/.bash_aliases bash/.inputrc zsh/.zshrc git/.gitconfig git/.gitignore_global vim/.vim vim/.vimrc .gemrc)
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

sublime_user_dir = File.join(home_dir, 'Library/Application Support/Sublime Text 3/Packages/User')
sublime_text_3_config_dir = 'sublime_text_3'

Dir.foreach(sublime_text_3_config_dir).each do |dir|
  dir = File.join(current_dir, sublime_text_3_config_dir, dir)
  symlink = File.join(sublime_user_dir, File.basename(dir))
  if File.exist?(symlink)
    puts "File already exists: #{symlink}"
  else
  	symlink.gsub!(' ', '\ ')
    puts "Symlinking: #{symlink}"
    `ln -ns #{dir} #{symlink}`
  end
end

vscode_user_dir = File.join(home_dir, 'Library/Application Support/Code/User')
vscode_config_dir = 'vscode'
Dir.foreach(vscode_config_dir).each do |dir|
  dir = File.join(current_dir, vscode_config_dir, dir)
  symlink = File.join(vscode_user_dir, File.basename(dir))
  if File.exist?(symlink)
    puts "File already exists: #{symlink}"
  else
  	symlink.gsub!(' ', '\ ')
    puts "Symlinking: #{symlink}"
    `ln -ns #{dir} #{symlink}`
  end
end

iterm2_config_file_name = 'com.googlecode.iterm2.plist'
symlink = File.join(home_dir, 'Library', 'Preferences', iterm2_config_file_name)
if File.exist?(symlink)
  puts "File already exists: #{symlink}"
else
  puts "Symlinking: #{symlink}"
  iterm2_config_file = File.join(current_dir, iterm2_config_file_name)
  `ln -ns #{iterm2_config_file} #{symlink}`
end

bitbar_user_dir = File.join(home_dir, '.bitbar')
bitbar_config_dir = File.join(current_dir, 'bitbar')
if File.exist?(bitbar_user_dir)
  puts "Directory already exists: #{bitbar_user_dir}"
else
  bitbar_user_dir.gsub!(' ', '\ ')
  puts "Symlinking: #{bitbar_user_dir}"
  `ln -ns #{bitbar_config_dir} #{bitbar_user_dir}`
end