namespace :load do
  task :defaults do
    set :unicorn_pid, -> { File.join(current_path, 'tmp', 'pids', 'unicorn.pid') }
    set :unicorn_roles, -> { :app }
  end
end

namespace :unicorn do
  desc 'Reload Unicorn (HUP); use this when preload_app: false'
  task :reload do
    on roles(fetch(:unicorn_roles)) do
      within current_path do
        info 'reloading...'
        execute :kill, '-s HUP', pid
      end
    end
  end
end

def pid
  "`cat #{fetch(:unicorn_pid)}`"
end
