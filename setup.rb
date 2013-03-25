#!/bin/env ruby
dirs = %w(bash/.bash_aliases bash/.inputrc zsh/.zshrc git/.gitconfig vim/.vim vim/.vimrc .gemrc)
current_dir = File.expand_path(Dir.pwd)
home_dir = File.expand_path("~")
 
dirs.each do |dir|
  dir = File.join(current_dir, dir)
  symlink = File.join(home_dir, File.basename(dir))
  `ln -ns #{dir} #{symlink}`
end