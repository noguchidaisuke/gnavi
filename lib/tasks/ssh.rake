namespace :ssh do
    desc "ECSへSSH" do
        task :ecslogin do
            cd && cd desktop
            ssh -i aws-and-infra-ssh-key.pem ec2-user@13.114.107.20
        end
    end
end
