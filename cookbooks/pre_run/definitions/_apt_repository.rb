define :apt_repositories, :name => nil do
  return if !params[:name]
  repos = [params[:name]].flatten

  repos.each { |repo| execute "sudo apt-add-repository #{repo}" }
  execute 'sudo apt-get update'
end
