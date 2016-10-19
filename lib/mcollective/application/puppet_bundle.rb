class MCollective::Application::PuppetBundle < MCollective::Application
  description 'Deploy and apply Puppet Bundles'

  USAGES = {
    'deploy' => %{mco puppet_bundle deploy --bundle <bundle path> [-a --apply]},
    'apply' => %{mco puppet_bundle apply --name <bundle name>}
  }

  usage <<-END_OF_USAGE
mco puppet_bundle [OPTIONS] [FILTERS] <ACTION> [ARGS]

  #{USAGES.values.sort.join("\n  ")}
END_OF_USAGE

  option :bundle,
         :description => 'The path to the bundle to deploy',
         :arguments   => [ '-b','--bundle BUNDLE_PATH' ],
         :type        => String

  option :apply,
         :description => 'If set, apply the bundle on deploy',
         :arguments   => [ '-a','--apply' ],
         :type        => :bool

  def post_option_parser(configuration)
    valid_actions = USAGES.keys

    if ARGV.size < 1
      raise %{\nPlease specify one of the following actions:\n    * #{valid_actions.join("\n    * ")}}
    end

    action = ARGV.shift

    unless valid_actions.include?(action)
      raise 'Action has to be one of ' + valid_actions.join(', ')
    end

    configuration[:command] = action
    configuration[:options] = options
  end

  def validate_configuration(configuration)
    required_options = {
      'deploy' => ['bundle'],
      'apply'  => ['name']
    }

    required_options.each_key do |command|
      if configuration[:command] == command
        required_options[command].each do |opt|
          if configuration[opt.to_sym].nil?
            raise %{\nYou must supply '#{opt}'\n\nUSAGE:\n\n#{application_usage.join("\n")}}
          end
        end
      end
    end
  end

  def main
    rpcutil = rpcclient('puppet_bundle')
    printrpc rpcutil.send(configuration[:command],configuration)

    printrpcstats :summarize => true
  end
end
