include_recipe 'apt'
include_recipe 'java'
include_recipe 'ark'
include_recipe 'runit'

ark 'dynamodb' do
  url node[:dynamodb_local][:source]
  extension 'tar.gz'
end

runit_service 'dynamodb-local' do
  service_name 'dynamodb-local'
  options({
    :dynamodb_local_port => node[:dynamodb_local][:port],
    :dynamodb_local_log_dir => node[:dynamodb_local][:log_dir]
  })
end
