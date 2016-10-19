module MCollective
  module Agent
    class PuppetBundle<RPC::Agent
      require 'mcollective/agent/puppet_bundle/util'
      include MCollective::Agent::PuppetBundle::Util

      require 'mcollective/agent/puppet_bundle/deploy'
      include MCollective::Agent::PuppetBundle::Deploy

      require 'mcollective/agent/puppet_bundle/apply'
      include MCollective::Agent::PuppetBundle::Apply

      action 'deploy' do
        bundle_deploy(bundle_path(request))

        if do_apply?(request)
          bundle_apply(bundle_name(request))
        end
      end

      action 'apply' do
        bundle_apply(bundle_name(request))
      end
    end
  end
end
