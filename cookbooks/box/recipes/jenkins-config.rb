execute "Change jenkins default shell" do
     command "sudo chsh -s /bin/bash jenkins"
     not_if "cat /etc/passwd | grep jenkins | grep -o bash"
end

execute "Set jenkins git username" do
     command "sudo -u jenkins -i git config --global user.name jenkins"
     not_if "test -f ~jenkins/.gitconfig && cat ~jenkins/.gitconfig | grep name"
end

execute "Set jenkins git email" do
     command "sudo -u jenkins -i git config --global user.email jenkins@php-ci.box"
     not_if "test -f ~jenkins/.gitconfig && cat ~jenkins/.gitconfig | grep email"
end
