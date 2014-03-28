apt_packages "git"

execute "trust github.com SSH host key" do
  command "ssh -o StrictHostKeyChecking=no git@github.com || true"
end

