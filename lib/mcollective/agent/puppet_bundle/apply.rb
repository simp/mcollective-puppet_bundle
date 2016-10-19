module MCollective::Agent::PuppetBundle::Apply
  def bundle_apply(bundle_name)
    $stderr.puts("Run #{bundle_name}")

    reply[:status] = 'woooo'
  end
end
