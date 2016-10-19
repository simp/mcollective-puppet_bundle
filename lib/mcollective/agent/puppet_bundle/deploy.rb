module MCollective::Agent::PuppetBundle::Deploy
  def bundle_deploy(bundle_path)
    $stderr.puts("Run #{bundle_path}")

    $stderr.puts('Send Bundle')

    $stderr.puts('Unpack Bundle')

    $stderr.puts('Return Result')

    reply[:status] = 'woooo'
  end
end
