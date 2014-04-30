define :apt_package do
  return if !params[:name]
  packages = [params[:name]].flatten.join(" ")

  execute "sudo DEBIAN_FRONTEND=noninteractive apt-get install -q -y #{packages}"
end

define :apt_packages do
  apt_package params[:name]
end
