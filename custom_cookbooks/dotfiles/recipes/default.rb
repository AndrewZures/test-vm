git_repository 'dotfiles (default)' do
  url 'git@github.com:andrewzures/dotfiles.git'
  destination '/home/vagrant/src/dotfiles'
end

execute 'create .vim/bundle direcory' do
  user 'vagrant'
  command 'mkdir /home/vagrant/.vim'
  not_if { Dir.exists?('/home/vagrant/.vim') }
end

execute 'install dotfiles' do
  # user 'vagrant'
  command 'ruby auto_install.rb'

  cwd '/home/vagrant/src/dotfiles'
end

execute 'update vim bundle' do
  user 'vagrant'
  command 'ruby update_bundle.rb --force'

  cwd '/home/vagrant/src/dotfiles/_vim'
end

