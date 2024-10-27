#!/usr/bin/env ruby

require_relative File.expand_path '~/.dotfiles/helpers.rb'

package_manager = get_package_manager_arg
validate_package_manager package_manager

install_package package_manager, 'tmux'

tpm_dir = File.expand_path '~/.tmux/plugins/tpm'
if Dir.exist? tpm_dir
  puts 'tpm already installed'.noop
else
  puts 'cloning tpm'.doing
  stream_command "git clone https://github.com/tmux-plugins/tpm #{tpm_dir}"
end

puts 'installing tpm plugins'.doing
stream_command '~/.tmux/plugins/tpm/bin/install_plugins'
