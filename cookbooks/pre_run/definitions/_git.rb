define :git_repository do
  puts "ultra"
  return if !params[:url] && !params[:destination]
  puts "sabre"

  puts "#{params[:url]} #{params[:destination]}"
  puts "exists?: #{Dir.exists?(params[:destination])}"

  execute "git clone #{params[:url]} #{params[:destination]}" do
    only_if { !Dir.exists?(params[:destination]) }
  end

end
