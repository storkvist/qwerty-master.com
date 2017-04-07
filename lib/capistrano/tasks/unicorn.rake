# frozen_string_literal: true

namespace :unicorn do
  desc 'Reload Unicorn (HUP); use this when preload_app: false'
  task :reload do
    on roles(:app) do
      within current_path do
        info 'reloading...'
        execute :kill, '-s HUP', pid
      end
    end
  end
end

def pid
  "`cat #{File.join(current_path, 'tmp', 'pids', 'unicorn.pid')}`"
end
