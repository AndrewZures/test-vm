 git_repository 'dotfiles (default)' do
   url "git@github.com:andrewzures/dotfiles.git"
   destination "/home/vagrant/dotfiles"
 end

# execute "copy vim directory" do
#  command "cp -R /home/my_vm/src/dotfiles/_vim /home/my_vm/.vim"
# #  user "my_vm"
#  not_if { Dir.exists?("/home/my_vm/.vim") }
# end
#
