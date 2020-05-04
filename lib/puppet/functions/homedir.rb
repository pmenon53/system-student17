Puppet::Functions.create_function(:homedir) do
  dispatch :homedir do
    param 'String', :user
  end
  def homedir(user)
    case user
    when 'root'
      return '/root'
    else
      return "/home/#{user}"
    end
  end
end
