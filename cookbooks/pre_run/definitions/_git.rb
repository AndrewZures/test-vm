define :git_repository do
  return if !params[:url] && !params[:destination]

  execute "git clone #{params[:url]} #{params[:destination]}" do
    user 'vagrant'
    only_if { !Dir.exists?(params[:destination]) }
  end

end
