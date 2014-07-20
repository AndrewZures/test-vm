execute 'apt-get update periodic' do
  command 'apt-get update'
  ignore_failure true

  only_if do
    filename = '/var/lib/apt/periodic/update-success-stamp'
    !File.exists?(filename) || File.mtime(filename) < Time.now - 86400
  end
end

apt_packages ['software-properties-common',
              'python-software-properties',
              'openssh-client',
              'git',
              'curl',
              'vim-nox',
              'ruby',
              'ruby-dev',
              'rbenv']

apt_repositories ['ppa:git-core/ppa'] do
  not_if 'which git'
end

execute 'trust github.com SSH host key' do
  user 'vagrant'
  command 'ssh -o StrictHostKeyChecking=no git@github.com || true'

  not_if { File.exists?('/home/vagrant/.ssh/known_hosts') }
end

