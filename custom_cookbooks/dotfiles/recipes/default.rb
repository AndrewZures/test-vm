git_repository 'dotfiles (default)' do
  url 'git@github.com:andrewzures/dotfiles.git'
  destination '/home/vagrant/src/dotfiles'
end

execute 'copy vim directory' do
  user 'vagrant'
  command 'cp -R /home/vagrant/src/dotfiles/_vim /home/vagrant/.vim'

  not_if { Dir.exists?('/home/vagrant/.vim') }
end

execute 'create .vim/bundle direcory' do
  user 'vagrant'
  command 'mkdir /home/vagrant/.vim/bundle'

  not_if { Dir.exists?('/home/vagrant/.vim/bundle') }
end

execute 'update vim bundle' do
  user 'vagrant'
  command 'ruby update_bundle.rb --force'

  cwd '/home/vagrant/.vim'
end

