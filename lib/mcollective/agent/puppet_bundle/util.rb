module MCollective::Agent::PuppetBundle::Util
  require 'facter'

  class MCollective::Agent::PuppetBundle::Error < StandardError; end

  def ddl
    @ddl = MCollective::DDL.new('puppet_bundle') unless @ddl
    return @ddl
  end

  def bundle_path(request)
    return @bundle_path if @bundle_path

    path = File.absolute_path(request.data[:bundle])

    unless File.directory?(path)
      raise MCollective::Agent::PuppetBundle::Error,"Content Path '#{path}' could not be found"
    end

    @bundle_path = path
    return @bundle_path
  end

  def bundle_name(request)
    return @bundle_name if @bundle_name

    @bundle_name = request.data[:bundle_name]

    return @bundle_path
  end

  def do_apply?(request)
    return @do_apply if @do_apply

    @do_apply = request.data[:apply]
    @do_apply = ddl.action_interface(request[:command])[:input][:bundle][:apply] unless @do_apply

    return @do_apply
  end
end
